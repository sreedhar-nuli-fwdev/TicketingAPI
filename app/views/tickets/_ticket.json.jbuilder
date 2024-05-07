json.extract! ticket, :id, :title, :description, :comments, :createdby, :modifiedby, :status, :assigned_to_user, :assigned_to_user_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
