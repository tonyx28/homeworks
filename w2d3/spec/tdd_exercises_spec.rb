require 'rspec'
require 'tdd_exercises'

describe 'TDD exercises' do
  describe 'Array' do

    describe '#my_uniq' do

      it 'removes duplicate numbers' do
        expect( [1, 2, 1, 3, 3].my_uniq ).to eq( [1, 2, 1, 3, 3].uniq )
      end

      it "doesn't modify original array" do
        arr = [1, 2, 1, 3, 3]
        arr.my_uniq
        expect( arr ).to eq( [1, 2, 1, 3, 3] )
      end

    end

    describe '#two_sum' do
      it 'returns [] when no pairs sum to zero' do
        expect( [-1, 0, 2, -5, 3].two_sum ).to eq( [] )
      end

      it 'finds all pairs of positions where the elements sum to zero ' do
        expect( [-1, 0, 2, -2, 1].two_sum ).to include( [2, 3],[0, 4] )
      end

      it 'returns pairs in the correct order' do
        expect( [-1, 0, 2, -2, 1].two_sum ).to eq( [[0, 4], [2, 3]] )
      end


    end

    describe '#my_transpose' do
      rows = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [7, 6, 5]
      ]

      cols = [
        [0, 3, 6, 7],
        [1, 4, 7, 6],
        [2, 5, 8, 5]
      ]

      x = rows.my_transpose

      it 'returns an array of arrays' do
        expect(x.class).to be(Array)
        expect(x.all? { |el| el.is_a?(Array)}).to be(true)
      end

      it 'returns array that is the right dimensions' do
        expect(x.length).to eq(rows.first.length)
        expect(x.first.length).to eq(rows.length)
      end

      it 'returns the desired array' do
        expect(x).to eq(cols)
      end



    end

    describe '#stock_picker' do
      stock_pricing = [8,3,5,1,12,9,0]
      it 'returns an array of two values' do
        expect(stock_pricing.stock_picker.length).to be(2)
      end

      it 'checks that buy date is before sell date' do
        x = stock_pricing.stock_picker
        expect(x.first).to be < x.last
      end

      it 'returns the best buy date/sell date pairing' do
        expect(stock_pricing.stock_picker).to eq([3,4])
      end
    end

  end
end
