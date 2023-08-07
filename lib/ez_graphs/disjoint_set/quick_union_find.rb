class QuickUnionFind
  def initialize(n)
    @root = Array.new(n) { |i| i }
  end

  def find(x)
    while x != root[x]
      x = root[x]
    end
    x
  end

  def union(x, y)
    root_x= find(x)
    root_y = find(y)
    return if root_x == root_y

    root[root_y] = root_x
    root
  end

  def connected?(x, y)
    find(x) == find(y)
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