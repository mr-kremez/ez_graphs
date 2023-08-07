# frozen_string_literal: true

class QuickUnionFind
  def initialize(graph_size)
    @root = Array.new(graph_size) { |i| i }
  end

  def find(vertex_x)
    vertex_x = root[vertex_x] while vertex_x != root[vertex_x]
    vertex_x
  end

  def union(vertex_x, vertex_y)
    root_x = find(vertex_x)
    root_y = find(vertex_y)
    return if root_x == root_y

    root[root_y] = root_x
    root
  end

  def connected?(vertex_x, vertex_y)
    find(vertex_x) == find(vertex_y)
  end

  private

  attr_reader :root
end

# # Test Case
# uf = QuickUnionFind.new(10)
# # 1-2-5-6-7 3-8-9 4
# uf.union(1, 2)
# uf.union(2, 5)
# uf.union(5, 6)
# uf.union(6, 7)
# uf.union(3, 8)
# uf.union(8, 9)
# puts uf.connected?(1, 5) => true
# puts uf.connected?(5, 7) => true
# puts uf.connected?(4, 9) => false
# # 1-2-5-6-7 3-8-9-4
# uf.union(9, 4)
# puts uf.connected?(4, 9) => true
#
