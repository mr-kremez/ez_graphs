# frozen_string_literal: true

require_relative "ez_graphs/version"
require_relative "ez_graphs/graph"
require_relative "ez_graphs/graph_node"
require_relative "ez_graphs/disjoint_set/quick_union_find"
require_relative "ez_graphs/disjoint_set/union_quick_find"

module EzGraphs
  class Error < StandardError; end
end
