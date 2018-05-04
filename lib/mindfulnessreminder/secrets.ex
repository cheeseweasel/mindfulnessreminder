defmodule Mindfulnessreminder.Secrets do
  def read(name) do
    File.read!("/run/secrets/#{name}")
    |> String.trim
  end

  def load_configuration() do
    with {:ok, files} <- File.ls("/run/secrets") do
      Enum.each(files, fn (file_name) ->
        load_configuration(file_name)
      end)
    end
  end

  def load_configuration(file_name) do
    {app, module, val} = load_configuration(file_name, read(file_name))
    if app != :empty do
      settings = Application.get_env(app, module)
      modded_settings = Keyword.merge(settings, val)
      Application.put_env(app, module, modded_settings)
    end
  end

  defp load_configuration(key = "mindfulnessreminder_postgres_username", username) do
    {:mindfulnessreminder, Mindfulnessreminder.Repo, username: username}
  end

  defp load_configuration(key = "mindfulnessreminder_postgres_password", password) do
    {:mindfulnessreminder, Mindfulnessreminder.Repo, password: password}
  end

  defp load_configuration(_, _) do
    {:empty, :empty, :empty}
  end
end
