json.extract! employee, :id, :employee_id, :first_name, :last_name, :email, :phone, :created_at, :updated_at
json.url employee_url(employee, format: :json)
