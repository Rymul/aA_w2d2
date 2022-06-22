require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(str)
        if salaries.has_key?(str)
            return true
        else
            return false
        end
    end

    def >(other_startup)
        self.funding > other_startup.funding
    end

    def hire(employee_name, title)
        if self.valid_title?(title)
            employees << Employee.new(employee_name, title)
        else
            raise ArgumentError.new "Invalid Title"
        end
    end

    def size
        employees.length
    end

    def pay_employee(employee)
        if salaries[employee.title] < funding
            employee.pay(salaries[employee.title])
            @funding -= salaries[employee.title]
        else
            raise ArgumentError.new "Not Enough Funding"
        end
    end

    def payday
        employees.each do |emp|
            pay_employee(emp)
        end
    end

    def average_salary
        sum = 0
        employees.each do |emp|
            sum += salaries[emp.title]
        end
        sum / employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(another_startup)
        @funding += another_startup.funding
        another_startup.salaries.each do |k,v|
            if !@salaries.has_key?(k)
                @salaries[k] = v
            end
        end
        @employees = (@employees + another_startup.employees)
        another_startup.close
    end

end



