use Mix.Config

# Configure your database
config :vendkit_eng, VendkitEng.Repo,
       adapter: Ecto.Adapters.MySQL,
       username: "vendingkit",
       password: "jamS1wu1hs3iWfgiE!",
       database: "snack",
       hostname: "localhost",
       binary_as: :field_type_blob,
       pool_size: 1
