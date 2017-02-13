json.extract! chore, :id, :name, :description, :coins, :due_date, :repeat_type, :repeat_data, :needs_approval?, :child_id, :parent_id, :created_at, :updated_at
json.url chore_url(chore, format: :json)