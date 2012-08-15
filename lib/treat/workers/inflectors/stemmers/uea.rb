# Stemming using the UEA algorithm, a stemmer that operates
# on a set of rules which are used as steps. There are two
# groups of rules: the first to clean the tokens, and
# the second to alter suffixes.
#
# Original paper: Jenkins, Marie-Claire, Smith, Dan,
# Conservative stemming for search and indexing, 2005.
class Treat::Workers::Inflectors::Stemmers::UEA

  # Require the 'uea-stemmer' gem.
  silence_warnings { require 'uea-stemmer' }

  # Keep only one copy of the stemmer.
  @@stemmer = nil

  # Stems a word using the UEA algorithm, implemented
  # by the 'uea-stemmer' gem.
  def self.stem(entity, options = {})
    @@stemmer ||= ::UEAStemmer.new
    @@stemmer.stem(entity.to_s).strip
  end
  
end