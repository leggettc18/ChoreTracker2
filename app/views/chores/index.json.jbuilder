json.array! @chores do |chore|
  date_format ='%Y-%m-%d'
  json.id chore.id
  json.title chore.name
  json.start chore.due_date.strftime(date_format)
  json.end chore.due_date.strftime(date_format)
end