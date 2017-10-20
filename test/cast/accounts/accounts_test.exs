defmodule Cast.AccountsTest do
  use Cast.DataCase

  alias Cast.Accounts

  describe "calendars" do
    alias Cast.Accounts.Calendar

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def calendar_fixture(attrs \\ %{}) do
      {:ok, calendar} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_calendar()

      calendar
    end

    test "list_calendars/0 returns all calendars" do
      calendar = calendar_fixture()
      assert Accounts.list_calendars() == [calendar]
    end

    test "get_calendar!/1 returns the calendar with given id" do
      calendar = calendar_fixture()
      assert Accounts.get_calendar!(calendar.id) == calendar
    end

    test "create_calendar/1 with valid data creates a calendar" do
      assert {:ok, %Calendar{} = calendar} = Accounts.create_calendar(@valid_attrs)
    end

    test "create_calendar/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_calendar(@invalid_attrs)
    end

    test "update_calendar/2 with valid data updates the calendar" do
      calendar = calendar_fixture()
      assert {:ok, calendar} = Accounts.update_calendar(calendar, @update_attrs)
      assert %Calendar{} = calendar
    end

    test "update_calendar/2 with invalid data returns error changeset" do
      calendar = calendar_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_calendar(calendar, @invalid_attrs)
      assert calendar == Accounts.get_calendar!(calendar.id)
    end

    test "delete_calendar/1 deletes the calendar" do
      calendar = calendar_fixture()
      assert {:ok, %Calendar{}} = Accounts.delete_calendar(calendar)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_calendar!(calendar.id) end
    end

    test "change_calendar/1 returns a calendar changeset" do
      calendar = calendar_fixture()
      assert %Ecto.Changeset{} = Accounts.change_calendar(calendar)
    end
  end
end
