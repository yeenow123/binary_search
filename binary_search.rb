require 'benchmark'

class Array
	def binary_search(val, low=0, high=self.size-1)
		mid = (low + high) / 2
		
		if low > high
			puts "Value not found."		
		elsif val == self[mid]
			puts "Found #{val} in position #{mid}."
		elsif val < self[mid]
			binary_search(val, low, mid - 1)	
		else
			binary_search(val, mid + 1, high)
		end	
	end

end

arr = (1..1_000_000).to_a

Benchmark.bm(7) do |r|
	r.report("array:") { arr.binary_search(18) }
end




