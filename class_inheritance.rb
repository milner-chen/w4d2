class Employee

    attr_accessor :salary

    def initialize(name, title, salary, boss = nil)
        @name, @title, @salary, @boss = name, title, salary, boss
        @boss.employees << self unless @boss.nil?
    end

    def bonus(multiplier)
        salary * multiplier
    end

end

class Manager < Employee

    attr_reader :employees

    def initialize(name, title, salary, boss = nil)
        super(name, title, salary, boss)
        @employees = []
    end

    def bonus(multiplier)
        sub_salaries * multiplier
    end

    def sub_salaries
        sum = 0
        employees.each do |employee|
            if employee.is_a?(Manager)
                sum += employee.salary + employee.sub_salaries
            else
                sum += employee.salary
            end
        end
        sum
    end

end