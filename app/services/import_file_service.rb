# frozen_string_literal: true

class ImportFileService
  def execute(file)
    @file = file

    import_file
  end

  private

  def import_file
    require 'csv'
    csv_text = File.read(Rails.root.join(@file.path))
    csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1', skip_blanks: true, col_sep: "\t")
    csv.each do |row|
      ActiveRecord::Base.transaction do
        import_parser(row)
      end
    end
  end

  def import_parser(row)
    i = Import.new
    i.buyer =       row['Comprador']
    i.description = row['Descrição']
    i.unit_price =  row['Preço Unitário'].to_f
    i.quantity =    row['Quantidade'].to_i
    i.address =     row['Endereço']
    i.supplier =    row['Fornecedor']
    i.save
  end
end
