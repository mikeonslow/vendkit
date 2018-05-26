defmodule Vending.Helpers.Email do
  import Bamboo.Email

  alias Vending.{Mailer}

  def test_email do
    new_email()
    |> to("foo@example.com")
    |> from("me@example.com")
    |> subject("Welcome!!!")
    |> html_body("<strong>Welcome</strong>")
    |> text_body("welcome")
    |> Mailer.deliver_now()
  end
end
