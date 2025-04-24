require("knitr")
require("tikzDevice")

### Default plotting parameters -----------------------------------------------
custom.par <- function(...) {
  par(mar = c(4.1, 3.1, 1.5, 1), oma = c(0, 0, 0, 0), pch = 16, bty = "l",
      mgp = c(1.7, 0.4, 0), cex = 0.75, cex.axis = 1.1, cex.lab = 1.1, cex.main = 1.2,
      tcl = -0.33, ...)
}

### Hooks ---------------------------------------------------------------------
def.chunk.hook  <- knitr::knit_hooks$get("chunk")
knitr::knit_hooks$set(chunk = function(x, options) {
  x <- def.chunk.hook(x, options)
  ifelse(!is.null(options$fontsize), paste0("\n", options$fontsize,"\n\n", x, "\n\n \\normalsize"), x)
})

def.output.hook <- knitr::knit_hooks$get("output")
knitr::knit_hooks$set(output = function(x, options) {
  ifelse(options$shadeoutput, paste0("\\begin{Shaded}\n\\begin{verbatim}\n", gsub(pattern = "```|^\\s*$", "", x, perl = T), "\\end{verbatim}\n\\end{Shaded}"), def.output.hook(x, options))
})

knit_hooks$set(c.par = function(before, options, envir) {
  if (before) custom.par(options$c.par)
})



### Constants -----------------------------------------------------------------
slide.width  <- 5.04 # slide width in inches
slide.height <- 3.78

due.col <- list(blue      = "#004c93",
                lightblue = "#dfe4f2",
                beige     = "#efe4bf")

### Options -------------------------------------------------------------------
options(tikzDocumentDeclaration = "\\documentclass[tikz, crop=true, class=beamer]{standalone}",
        tikzMetricsDictionary   = "includes/tikzDictionary",
        tikzDefaultEngine = "xetex"
        # tikzXelatexPackages = c(options("tikzXelatexPackages"), "\\usepackage[T1]{fontenc}")
        # tikzLatexPackages = c(options("tikzLatexPackages"), "\\usepackage[T1]{fontenc}")
        )


opts_chunk$set(echo = T, fontsize = "\\footnotesize", dev = "tikz", cache = T, 
               message = FALSE, warning = FALSE, shadeoutput = F, 
               fig.width = 0.85 * slide.width, fig.asp = 0.6, fig.align = "center", 
               c.par = T, fig.path = "Plots/")
options(digits = 7)

