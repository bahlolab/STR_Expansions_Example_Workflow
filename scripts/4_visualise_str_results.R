#!/usr/bin/env Rscript

# Plot STR output generate by ExpansionHunter and exSTRa

results_dir <- "results"

repeatdb_exSTRa <- "~/STR_Expansions_Example_Workflow/repeats/known/exSTRa_known_hg19.txt"

highlight_samples <- list(SCA1="SRR7205174", SCA3="SRR7205176", SCA6="SRR7205175", SBMA=c("SRR7205170", "SRR7205169"), FTDALS1="SRR7205172", DM2="SRR7205171", DM1="SRR7205168", FRDA="SRR7205167")

# ---------------------------------------------------------------------------------------

library(gdata)
library(cowplot)
library(grid)
library(gridExtra)
library(exSTRa)
source("functions/load_ExpansionHunter_VCF.R")
source("functions/load_exSTRa_scores.R")
source("functions/plot_ExpansionHunter_h1_h2_scatter.R")
source("functions/plot_exSTRa_ECDF.R")

# exSTRa
exSTRa_files <- list.files(paste0(results_dir, "/exSTRa"), pattern="txt$", full.names=TRUE)
exSTRa_scores <- load_exSTRa_scores(exSTRa_files, 
                                    database=exSTRa_db, 
                                    groups.regex=c(case="*", control=""))
# # Compute exSTRa tsum test p-values
# exSTRa_tsum <- tsum_test(exSTRa_scores)

# ExpansionHunter
ExpansionHunter_files <- list.files(paste0(results_dir, "/ExpansionHunter"), pattern="vcf$", full.names=TRUE)
ExpansionHunter_results <- load_ExpansionHunter_VCF(ExpansionHunter_files)


locus_list <- unique(exSTRa_scores$db$locus)

pdf("plot_known_candidate_RE.pdf", height=8, width=14)
for (ll in locus_list) {
    # Load locus thresholds from exSTRa
    db <- exSTRa_scores$db[exSTRa_scores$db$locus == ll, ]
    ll_stable_high <- db$norm_up
    ll_stable_high_bp <- db$norm_up * nchar(db$motif)
    ll_unstable_low <- db$aff_low
    ll_unstable_low_bp <- db$aff_low * nchar(db$motif)
    
    # Create plots
    p_title <- textGrob(ll, gp=gpar(cex=2, col="navy"))
    p_exSTRa_ECDF <- plot_exSTRa_ECDF(exSTRa_scores, ll, highlight_samples=highlight_samples[[ll]])
    p_EH_scatter <- plot_ExpansionHunter_h1_h2_scatter(ExpansionHunter_results, ll, highlight_samples=highlight_samples)
    
    # Add theme and remove legends
    theme <- theme(legend.position="none", plot.title = element_text(size=18))
    p_exSTRa_ECDF <- p_exSTRa_ECDF + theme
    p_EH_scatter <- p_EH_scatter + theme
    
    if(is.null(p_exSTRa_ECDF)) {
        p_exSTRa_ECDF <- textGrob("")
    } else {
        p_exSTRa_ECDF <- p_exSTRa_ECDF + ggtitle("exSTRa (outlier)") + geom_vline(xintercept=ll_stable_high_bp, colour="#377eb8", linetype="dashed") + geom_vline(xintercept=ll_unstable_low_bp, colour="#e41a1c", linetype="dashed") + xlab("number repeated bases")
    }
    if(is.null(p_EH_scatter)) {
        p_EH_scatter <- textGrob("")
    } else {
        p_EH_scatter <- p_EH_scatter + ggtitle("ExpansionHunter (genotyping)") + geom_hline(yintercept=ll_stable_high, colour="#377eb8", linetype="dashed") + geom_hline(yintercept=ll_unstable_low, colour="#e41a1c", linetype="dashed") + scale_x_continuous(limits=c(0, 60)) + xlab("size of shorter allele") + scale_y_continuous() + ylab("size of longer allele")
    }

    grid.arrange(p_title, p_EH_scatter, p_exSTRa_ECDF, layout_matrix=matrix(c(1, 2, 1, 3), ncol=2), heights=c(1, 6))
}
dev.off()

