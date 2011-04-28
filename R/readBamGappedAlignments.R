setMethod(readBamGappedAlignments, "character",
          function(file, index, ..., which)
{
    if (missing(which))
        which <- RangesList()
    if (missing(index))
        index <-
            if (0L == length(which)) character()
            else file
    bam <- open(BamFile(file, index), "rb")
    on.exit(close(bam))
    callGeneric(bam, character(), ..., which=which)
})
