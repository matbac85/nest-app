defmodule NestWeb.Layouts do
  @moduledoc """
  This module holds different layouts used by your application.

  See the `layouts` directory for all templates available.
  The "root" layout is a skeleton rendered as part of the
  application router. The "app" layout is set as the default
  layout on both `use NestWeb, :controller` and
  `use NestWeb, :live_view`.
  """
  use NestWeb, :html

  embed_templates "layouts/*"
end
