module EzGraphs
  class Graph
    attr_accessor :nodes

    def initialize(nodes=[])
      @nodes = nodes
    end

    def add_node(value)
      @nodes << GraphNode.new(value)
    end
  end
end
