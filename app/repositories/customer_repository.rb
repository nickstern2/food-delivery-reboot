require 'pry-byebug'
require 'csv'
require_relative '../models/customer'

class CustomerRepository
  def initialize(filepath)
    @csv_file_path = filepath
    @customers = []
    @new_id = 1 #always store the first id in the csv as 1

    load_csv if File.exist? filepath
  end

  def all
    return @customers
  end

  def add(new_customer) # new_customer ==> Customer instance
    new_customer.id = @new_id
    @customers << new_customer
    write_to_csv
    @new_id += 1
  end

  def find(search_id)
    # condition = search_id == the id of the meal
    @customers.find do |customer|
      customer.id == search_id
    end
  end

  private

  def load_csv
    csv_options = { headers: true, header_converters: :symbol }

    CSV.foreach(@csv_file_path, csv_options) do |row|
      # convert id and price because it's not suppose to be a string
      row[:id] = row[:id].to_i
      @customers << Customer.new(row)
    end

    @new_id = @customers.last.id + 1
  end

  def write_to_csv
    csv_options = { col_sep: ',' }

    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      csv << ['id','name','address']
      @customers.each do |customer|
        # creating the row for my csv
        id = customer.id
        name = customer.name
        address = customer.address

        csv << [id, name, address]
      end
    end
  end
end






