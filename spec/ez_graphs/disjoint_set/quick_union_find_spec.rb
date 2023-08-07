# frozen_string_literal: true

RSpec.describe EzGraphs::DisjointSet::QuickUnionFind do
  subject { described_class.new(root: root, rank: rank) }

  # 1-2-5-6-7 3-8-9 4
  let(:root) { [0, 1, 1, 3, 4, 1, 1, 1, 3, 3] }
  let(:rank) { [0, 1, 0, 1, 0, 0, 0, 0, 0, 0] }

  describe '#find' do
    it 'returns corresponding value from root array' do
      expect(subject.find(5)).to eq(1)
      expect(subject.find(4)).to eq(4)
      expect(subject.find(9)).to eq(3)
      expect(subject.find(3)).to eq(3)
    end
  end

  describe '#union' do
    # 1-2-5-6-7 3-8-9-4
    it 'properly merges unions' do
      subject.union(9, 4)
      expect(subject.root).to eq([0, 1, 1, 3, 3, 1, 1, 1, 3, 3])
      expect(subject.rank).to eq([0, 1, 0, 1, 0, 0, 0, 0, 0, 0])
    end
  end

  describe '#connected?' do
    it 'returns true if vertices are connected' do
      expect(subject.connected?(1, 5)).to be(true)
      expect(subject.connected?(8, 9)).to be(true)
      expect(subject.connected?(6, 7)).to be(true)
    end

    it 'returns false if vertices are not connected' do
      expect(subject.connected?(1, 3)).to be(false)
      expect(subject.connected?(8, 4)).to be(false)
      expect(subject.connected?(5, 4)).to be(false)
    end
  end
end
