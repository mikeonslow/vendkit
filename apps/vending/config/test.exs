use Mix.Config

# Configure your database
config :vending, Vending.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "vendingkit",
  password: "d!kjsehr740s3iWfgiE!",
  database: "snack",
  hostname: "localhost",
  binary_as: :field_type_blob,
  pool_size: 1
