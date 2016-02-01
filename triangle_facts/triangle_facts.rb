# Killer facts about triangles AWW YEAH
class Triangle
	attr_accessor :side1,:side2,:side3

	def initialize(side1,side2,side3)
		@side1,@side2,@side3 = side1,side2,side3
	end

	def equilateral
		side1 == side2 && side2 == side3
	end

	def isosceles
		[side1,side2,side3].uniq.length == 2
	end

	def scalene
		!(equilateral || isosceles)
	end

	def state_type
		puts 'This triangle is equilateral!' if equilateral
		puts 'This triangle is isosceles! Also, that word is hard to type.' if isosceles
		puts 'This triangle is scalene and mathematically boring.' if scalene
	end

	def state_angles
		angles = self.calculate_angles(side1,side2,side3)
		puts 'The angles of this triangle are ' + angles.join(',')

		puts 'This triangle is also a right triangle!' if angles.include? 90
		puts ''
	end

	def recite_facts
		state_type
		state_angles
	end

	def angle_calculation(s1,s2,s3)
		radians_to_degrees(Math.acos((s2**2 + s3**2 - s1**2) / (2.0 * s2 * s3)))
	end

	def calculate_angles(a,b,c)
		angleA = angle_calculation(a,b,c)
		angleB = angle_calculation(b,a,c)
		angleC = angle_calculation(c,a,b)
		[angleA, angleB, angleC]
	end

	def radians_to_degrees(rads)
		(rads * 180 / Math::PI).round
	end
end


triangles = [
	[5,5,5],
	[5,12,13],
]
triangles.each { |sides|
	tri = Triangle.new(*sides)
	tri.recite_facts
}
