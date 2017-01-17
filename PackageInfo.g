#
# DeepThought: This package provides functions for multiplication and other computations in finitely generated nilpotent groups based on the Deep Thought algorithm.
#
# This file contains package meta data. For additional information on
# the meaning and correct usage of these fields, please consult the
# manual of the "Example" package as well as the comments in its
# PackageInfo.g file.
#
SetPackageInfo( rec(

PackageName := "DeepThought",
Subtitle := "This package provides functions for multiplication and other computations in finitely generated nilpotent groups based on the Deep Thought algorithm.",
Version := "0.1",
Date := "17/01/2017", # dd/mm/yyyy format

Persons := [
  rec(
    IsAuthor := true,
    IsMaintainer := true,
    FirstNames := "Nina",
    LastName := "Wagner",
    WWWHome := "TODO",
    Email := "nina.wagner@math.uni-giessen.de",
    PostalAddress := "TODO",
    Place := "Giessen",
    Institution := "JLU Giessen",
  ),
],

SourceRepository := rec(
    Type := "git",
    URL := Concatenation( "https://github.com/duskydolphin/", ~.PackageName ),
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
#SupportEmail   := "TODO",
PackageWWWHome  := "https://duskydolphin.github.io/DeepThoughtPackage/",
PackageInfoURL  := Concatenation( ~.PackageWWWHome, "PackageInfo.g" ),
README_URL      := Concatenation( ~.PackageWWWHome, "README.md" ),
ArchiveURL      := Concatenation( ~.SourceRepository.URL,
                                 "/releases/download/v", ~.Version,
                                 "/", ~.PackageName, "-", ~.Version ),

ArchiveFormats := ".tar.gz",

##  Status information. Currently the following cases are recognized:
##    "accepted"      for successfully refereed packages
##    "submitted"     for packages submitted for the refereeing
##    "deposited"     for packages for which the GAP developers agreed
##                    to distribute them with the core GAP system
##    "dev"           for development versions of packages
##    "other"         for all other packages
##
Status := "dev",

AbstractHTML   :=  "",

PackageDoc := rec(
  BookName  := "DeepThought",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "This package provides functions for multiplication and other computations in finitely generated nilpotent groups based on the Deep Thought algorithm.",
),

Dependencies := rec(
  GAP := ">= 4.8",
  NeededOtherPackages := [ [ "GAPDoc", ">= 1.5" ] ],
  SuggestedOtherPackages := [ ],
  ExternalConditions := [ ],
),

AvailabilityTest := function()
        return true;
    end,

TestFile := "tst/testall.g",

#Keywords := [ "TODO" ],

));


