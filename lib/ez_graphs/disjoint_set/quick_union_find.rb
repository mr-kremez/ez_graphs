# frozen_string_literal: true

module EzGraphs
  module DisjointSet
    class QuickUnionFind
      attr_reader :root, :rank

      def initialize(graph_size: 0, root: [], rank: [])
        @root = root.empty? ? Array.new(graph_size) { |i| i } : root
        @rank = rank.empty? ? Array.new(graph_size) { 0 } : rank
      end

      def find(vertex_x)
        return vertex_x if vertex_x == root[vertex_x]

        root[vertex_x] = find(root[vertex_x])
      end

      def union(vertex_x, vertex_y)
        root_x = find(vertex_x)
        root_y = find(vertex_y)
        return if root_x == root_y

        union_roots_by_rank(root_x, root_y)

        self
      end

      def connected?(vertex_x, vertex_y)
        find(vertex_x) == find(vertex_y)
      end

      def num_of_isolated_sets
        count = 0
        root.each_with_index do |root, i|
          count += 1 if root == i
        end
        count
      end

      private

      def union_roots_by_rank(root_x, root_y)
        return root[root_x] = root_y if rank[root_x] < rank[root_y]
        return root[root_y] = root_x if rank[root_x] > rank[root_y]

        root[root_y] = root_x
        rank[root_x] += 1
      end
    end
  end
end

# # Test Case
# uf = QuickUnionFind.new(graph_size: 10)
# # 0-1-2-5-6-7 3-8-9 4  @rank=[0, 1, 0, 1, 0, 0, 0, 0, 0, 0], @root=[1, 1, 1, 3, 4, 1, 1, 1, 3, 3]
# uf.union(1, 2)
# uf.union(2, 5)
# uf.union(5, 6)
# uf.union(6, 7)
# uf.union(3, 8)
# uf.union(8, 9)
# puts uf.connected?(1, 5) => true
# puts uf.connected?(5, 7) => true
# puts uf.connected?(4, 9) => false
# # 0-1-2-5-6-7 3-8-9-4
# uf.union(9, 4) @rank=[0, 1, 0, 1, 0, 0, 0, 0, 0, 0], @root=[1, 1, 1, 3, 3, 1, 1, 1, 3, 3]
# puts uf.connected?(4, 9) => true
#
