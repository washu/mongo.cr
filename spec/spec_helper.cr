def create_client
  Mongo::Client.new("mongodb://core:core@ds015740.mlab.com:15740/core_test?retryWrites=false")
end

def create_database
  client = create_client
  client["core_test"]
end

def create_collection
  db = create_database
  db["my_col"]
end

def with_database
  db = create_database
  begin
    yield db
  ensure
    db.drop
  end
end

def with_collection
  with_database do |db|
    col = db["my_col"]
    yield col
  end
end


