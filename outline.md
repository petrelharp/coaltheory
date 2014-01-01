SOME ASPECTS OF COALESCENT THEORY
=================================

Spring 2014 -- Peter Ralph -- USC 


Outline
=======

1. Pedigrees and inheritance, and statistics of the realized ARG
  * modeling recombination, segregation, and mutation
  * the ARG: embedding of recombination into the pedigree 
  * single-site statistics
    + heterozygosity
    + Fst
    + coalescent time distribution
    + site frequency spectrum
  * multiple-site statistics
    + linkage disequilibrium
    + haplotype blocks  
2. Population models of pedigrees and lineages
  * Moran models
    + haploid
    + diploid
  * Cannings models
  * Lambda coalescents
3. Expected values under population models
  * allele frequencies
    + forwards and reverse processes
    + limiting, continuous process
  * single-site statistics
    + heterozygosity and LD and "effective population size"
    + Ewens sampling/site frequency spectrum from mean time in tree
  * distinction between population distribution and (annealed) expectation
4. Recombination, and blocks
  * decomposition of a sampled set into minimal collection of IBD blocks
  * distribution of age of MRCA of a site is the size-biased version of age of MRCA of a block
  * mean block length spectrum a function of coalescent time distribution
5. Junctions and multiply shared blocks
  * junctions are inherited as Mendelian alleles
  * expected number of genome-wide k-way shared recent blocks
  * parallel to rare variants
6. Bulk coalescent theory
  * law of large numbers for lineages
  * single-lineage relationship to many lineages
  * distribution of longest shared block



Readings
========

- Coalescent Theory, (book), Wakeley
- something by Möhle
- [Gene genealogies and the coalescent process](http://web.eve.ucdavis.edu/pbg298/pdfs/Hudson_OxfordSurveysEvolBiol_1991.pdf), Hudson, 1990.
- [An Ancestral Recombination Graph](http://www.math.canterbury.ac.nz/~r.sainudiin/recomb/ima.pdf), by Griffiths and Marjoram, 1997.
- [An Ancestral Recombination Graph for Diploid Populations with Skewed Offspring Distribution](http://www.genetics.org/content/193/1/255.abstract), by Birkner, Blath, and Eldon, Genetics 2013
- [Gene genealogies within a fixed pedigree, and the robustness of Kingman's coalescent.](http://www.ncbi.nlm.nih.gov/pubmed/22234858), by Wakeley, King, Low, and Ramachandran.
- [Coalescent Processes When the Distribution of Offspring Number Among Individuals Is Highly Skewed](http://www.genetics.org/content/172/4/2621.full), by Eldon and Wakeley, 2006.
- [A fuller theory of "Junctions" in inbreeding](http://dx.doi.org/10.1038/hdy.1954.17), by Fisher 1954.
- [Distribution of Parental Genome Blocks in Recombinant Inbred Lines](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3189807/), by Martin and Hospital, 2011.


Assignments
===========

Simulate something from the course, with write-up of methods and results, including code and graphs (submit via git)


Ambitious suggestions:
------------

+ Simulate with a "long-tailed" offspring distribution -- verify convergence to a Beta-coalescent, and investigate the transition between Kingman's and the Beta coalescent, perhaps as the upper bound on the possible number of offspring is increased.

+ Investigate empirical distribution within a fixed pedigree -- how much variation in coalescent time distributions are there between instantiations of recombination and segregation in a fixed pedigree?  Between pedigrees?
  see [Gene genealogies within a fixed pedigree, and the robustness of Kingman's coalescent.](http://www.ncbi.nlm.nih.gov/pubmed/22234858), by Wakeley, King, Low, and Ramachandran.

+ Investigate the bulk ("law of large numbers") behavior of a large number of lineages in a pedigree -- for instance, are the number of lineages present well-described by the deterministic (mean-value) equations?


Ideas
-----

- recursions for identity by descent
- mean IBD block length spectrum
- dual processes within a given pedigree
- PSMC
- long-tailed, beta coalescents
