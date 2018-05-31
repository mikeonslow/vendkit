defmodule Vending.Helpers.Email do
  use Bamboo.Phoenix, view: Vending.EmailView

  import Bamboo.Email

  alias Vending.{Mailer}

  def test_email do
    inspect(base_email() |> render("email.html"))
  end

  defp base_email do
    new_email()
    |> from("no-reply@mydomain.io")
    |> to("anyone@mydomain.io")
    |> put_html_layout({Vending.LayoutView, "email.html"})
  end
end
