require 'benchmark'

class BinarySearch
	
	def initialize(arr)
		@arr = arr.sort
	end

	def recursive_search(low=0, high=@arr.size-1, val)
		mid = (low + high) / 2
		
		if low > high
			puts "Value not found."		
		elsif (val == @arr[mid])
			puts "Found #{val} in position #{mid}."
		elsif val < @arr[mid]
			recursive_search(low, mid - 1, val)	
		else
			recursive_search(mid + 1, high, val)
		end	

	end

end

class BinarySearchTest
	def initialize
		arr = (1..1000000).to_a
		@bs = BinarySearch.new(arr)
	end

	def BSTest
		@bs.recursive_search(17)
		
	end
end

class Array
	def binary_search(val, low=0, high=self.size-1)
		mid = (low + high) / 2
		
		if low > high
			puts "Value not found."		
		elsif (val == self[mid])
			puts "Found #{val} in position #{mid}."
		elsif val < self[mid]
			binary_search(low, mid - 1, val)	
		else
			binary_search(mid + 1, high, val)
		end	
	end

end

arr1 = (1..1000000).to_a
bstest = BinarySearchTest.new

Benchmark.bm(7) do |r|
	r.report("class:") { bstest.BSTest }
	r.report("array:") { arr1.binary_search(17) }
end




