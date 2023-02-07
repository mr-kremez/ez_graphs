# frozen_string_literal: true

module EzGraphs
  class GraphNode
    attr_accessor :val, :neighbors

    def initialize(val, neighbors = [])
      @val = val
      @neighbors = neighbors
    end

    def add_edge(neighbor)
      @neighbors << neighbor
    end
  end
end
