require "application_system_test_case"

class TicketsTest < ApplicationSystemTestCase
  setup do
    @ticket = tickets(:one)
  end

  test "visiting the index" do
    visit tickets_url
    assert_selector "h1", text: "Tickets"
  end

  test "creating a Ticket" do
    visit tickets_url
    click_on "New Ticket"

    fill_in "Assigned to user", with: @ticket.assigned_to_user
    fill_in "Assigned to user", with: @ticket.assigned_to_user_id
    fill_in "Comments", with: @ticket.comments
    fill_in "Createdby", with: @ticket.createdby
    fill_in "Description", with: @ticket.description
    fill_in "Modifiedby", with: @ticket.modifiedby
    fill_in "Status", with: @ticket.status
    fill_in "Title", with: @ticket.title
    click_on "Create Ticket"

    assert_text "Ticket was successfully created"
    click_on "Back"
  end

  test "updating a Ticket" do
    visit tickets_url
    click_on "Edit", match: :first

    fill_in "Assigned to user", with: @ticket.assigned_to_user
    fill_in "Assigned to user", with: @ticket.assigned_to_user_id
    fill_in "Comments", with: @ticket.comments
    fill_in "Createdby", with: @ticket.createdby
    fill_in "Description", with: @ticket.description
    fill_in "Modifiedby", with: @ticket.modifiedby
    fill_in "Status", with: @ticket.status
    fill_in "Title", with: @ticket.title
    click_on "Update Ticket"

    assert_text "Ticket was successfully updated"
    click_on "Back"
  end

  test "destroying a Ticket" do
    visit tickets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ticket was successfully destroyed"
  end
end
