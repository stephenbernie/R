R version 2.15.3 (2013-03-01) -- "Security Blanket"
Copyright (C) 2013 The R Foundation for Statistical Computing
ISBN 3-900051-07-0
Platform: x86_64-apple-darwin9.8.0/x86_64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[R.app GUI 1.53 (6451) x86_64-apple-darwin9.8.0]

[Workspace restored from /Users/apple/.RData]
[History restored from /Users/apple/.Rapp.history]

> setwd("/Users/apple/projects/R")
> #list: list is one of the most complex data type in R. a list is the set of some components with a specific coordination. List allows you to integrate many components under one component, even it might not be relevant, for example, the components in a list can be some vectors, some matrixes or data frames, even combination of other lists.
> g <- "first list"
> h <- c(24, 25, 95, 81)
> j <- matrix(1:10, nrow=5)
> k <- c("one", "two", "three")
> mylist <- list(title=g, ages=h,j,k)
> #create the list
> mylist
$title
[1] "first list"

$ages
[1] 24 25 95 81

[[3]]
     [,1] [,2]
[1,]    1    6
[2,]    2    7
[3,]    3    8
[4,]    4    9
[5,]    5   10

[[4]]
[1] "one"   "two"   "three"

> mylist[[2]]
[1] 24 25 95 81
> mylist[["ages"]]
[1] 24 25 95 81
> #the notation [[2]] here means 'output the second component'
> #data input
> #first, use keyboard
> #second, use txt
> #third use excel(csv)
> #graphic sketch
> attach(mtcars)
> plot(wt, mpg)
> abline(lm(mpg-wt))
Error in formula.default(object, env = baseenv()) : invalid formula
> abline(lm(mpg~wt))
> title("regression")
> detach(mtcars)
> pdf("graph.pdf")
> attach(mtcars)
> plot(wt, mpg)
> abline(lm(mpg~wt))
> title("regression")
> detach(mtcars)
> dev.off()
quartz 
     2 
> hist(wt, mpg)
Error in hist(wt, mpg) : object 'wt' not found
> attach(mtcars)
> hist(wt, mpg)
Error in hist.default(wt, mpg) : 
  some 'x' not counted; maybe 'breaks' do not span range of 'x'
> dose <- c(20, 30, 40, 45, 60)
> drugA <- c(16, 20, 27, 40, 60)
> drugB <- c(15, 18, 25, 31, 40)
> library(ggplot2)
Find out what's changed in ggplot2 with
news(Version == "0.9.3.1", package = "ggplot2")

Attaching package: ‘ggplot2’

The following object(s) are masked from ‘mtcars’:

    mpg

> detach(mtcars)
> qplot(dose, drugA, drugB)
> qplot(dose, drugA, type="b")
> plot(dose, drugA, type="b")
> qplot(dose, drugA, type="c")
> plot(dose, drugA, type="c")
> plot(dose, drugA, type="d")
Error in plot.xy(xy, type, ...) : invalid plot type 'd'
> plot(dose, drugA, type="a")
Error in plot.xy(xy, type, ...) : invalid plot type 'a'
> plot(dose, drugA, type="b")
> opar <- par(no.readonly=TRUE)
> par(lty=2, pch=17)
> plot(does, drugA, type="b")
Error in plot(does, drugA, type = "b") : object 'does' not found
> plot(dose, drugA, type="b")
> par(opar)
> update.package
Error: object 'update.package' not found
> update.packages
function (lib.loc = NULL, repos = getOption("repos"), contriburl = contrib.url(repos, 
    type), method, instlib = NULL, ask = TRUE, available = NULL, 
    oldPkgs = NULL, ..., checkBuilt = FALSE, type = getOption("pkgType")) 
{
    force(ask)
    text.select <- function(old) {
        update <- NULL
        for (k in seq_len(nrow(old))) {
            cat(old[k, "Package"], ":\n", "Version", old[k, "Installed"], 
                "installed in", old[k, "LibPath"], if (checkBuilt) 
                  paste("built under R", old[k, "Built"]), "\n", 
                "Version", old[k, "ReposVer"], "available at", 
                simplifyRepos(old[k, "Repository"], type))
            cat("\n")
            answer <- substr(readline("Update (y/N/c)?  "), 1L, 
                1L)
            if (answer == "c" | answer == "C") {
                cat("cancelled by user\n")
                return(invisible())
            }
            if (answer == "y" | answer == "Y") 
                update <- rbind(update, old[k, ])
        }
        update
    }
    if (is.null(lib.loc)) 
        lib.loc <- .libPaths()
    if (is.null(available)) 
        available <- available.packages(contriburl = contriburl, 
            method = method)
    if (!is.matrix(oldPkgs) && is.character(oldPkgs)) {
        subset <- oldPkgs
        oldPkgs <- NULL
    }
    else subset <- NULL
    if (is.null(oldPkgs)) {
        oldPkgs <- old.packages(lib.loc = lib.loc, contriburl = contriburl, 
            method = method, available = available, checkBuilt = checkBuilt)
        if (!is.null(oldPkgs)) {
            pkg <- 0L
            while (pkg < nrow(oldPkgs)) {
                pkg <- pkg + 1L
                if (find.package(oldPkgs[pkg], lib.loc = lib.loc) != 
                  find.package(oldPkgs[pkg], lib.loc = oldPkgs[pkg, 
                    2])) {
                  warning(sprintf("package '%s' in library '%s' will not be updated", 
                    oldPkgs[pkg], oldPkgs[pkg, 2]), call. = FALSE, 
                    immediate. = TRUE)
                  oldPkgs <- oldPkgs[-pkg, , drop = FALSE]
                  pkg <- pkg - 1L
                }
            }
        }
        if (is.null(oldPkgs)) 
            return(invisible())
    }
    else if (!(is.matrix(oldPkgs) && is.character(oldPkgs))) 
        stop("invalid 'oldPkgs'; must be a character vector or a result from old.packages()")
    if (!is.null(subset)) {
        oldPkgs <- oldPkgs[rownames(oldPkgs) %in% subset, , drop = FALSE]
        if (nrow(oldPkgs) == 0) 
            return(invisible())
    }
    update <- if (is.character(ask) && ask == "graphics") {
        if (.Platform$OS.type == "windows" || .Platform$GUI == 
            "AQUA" || (capabilities("tcltk") && capabilities("X11"))) {
            k <- select.list(oldPkgs[, 1L], oldPkgs[, 1L], multiple = TRUE, 
                title = "Packages to be updated", graphics = TRUE)
            oldPkgs[match(k, oldPkgs[, 1L]), , drop = FALSE]
        }
        else text.select(oldPkgs)
    }
    else if (isTRUE(ask)) 
        text.select(oldPkgs)
    else oldPkgs
    if (length(update)) {
        if (is.null(instlib)) 
            instlib <- update[, "LibPath"]
        libs <- unique(instlib)
        for (l in libs) install.packages(update[instlib == l, 
            "Package"], l, contriburl = contriburl, method = method, 
            available = available, ..., type = type)
    }
}
<bytecode: 0x1076802e0>
<environment: namespace:utils>
> update.packages()
> update.library()
Error: could not find function "update.library"
> update.libraries()
Error: could not find function "update.libraries"
> n <- 40
> colour <- rainbow(n)
> pie(rep(1, n), labels=colours, col=colours)
Error in rep(col, length.out = nx) : 
  attempt to replicate an object of type 'closure'
> pie(rep(1, n), labels=colour, col=colour)
> pie(rep(1, n), labels=colour, col=colour, bg=#f1f1f1)
+ 
+ end
+ 
+ pie
Error: unexpected symbol in:
"
pie"
> pie(rep(1, n), labels=colour, col=colour, bg="#f1f1f1")
> pie(rep(1, n), labels=colour, col=colour, bg="#fff")
Error in text.default(1.1 * P$x, 1.1 * P$y, labels[i], xpd = TRUE, adj = ifelse(P$x <  : 
  invalid RGB specification
> pie(rep(1, n), labels=colour, col=colour, bg="#f0f0f0")
> pie(rep(1, n), labels=colour, col=colour, bg="#000001")
> 
