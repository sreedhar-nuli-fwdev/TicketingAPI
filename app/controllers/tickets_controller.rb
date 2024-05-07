class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update destroy ]

  # GET /tickets or /tickets.json
  def index
    @tickets = Ticket.all
    render json: @tickets
  end

  # GET /tickets/1 or /tickets/1.json
  def show
    @ticket = Ticket.includes(:comments).find(params[:id])
    render json: @ticket, include: 'comments'
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets or /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)

    respond_to do |format|
      if @ticket.save
        assign_ticket(@ticket)
        format.json { render :show, status: :created, location: @ticket }
      else
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1 or /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        render :show, status: :ok, location: @ticket
      else
        render json: @ticket.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /tickets/1 or /tickets/1.json
  def destroy
    @ticket.destroy

    respond_to do |format|
      render :show, status: :ok
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:title, :description, :createdby, :modifiedby, :status, :assigned_to_user, :assigned_to_user_id)
    end

  def assign_ticket(ticket)
    # Names of the agents
    agent_names = ["Agent1", "Agent2"]

    # Calculate the index of the agent to assign the ticket to based on the ticket ID
    agent_index = ticket.id % agent_names.length

    # Assign the agent name to the agent_id attribute of the ticket record
    agent_name = agent_names[agent_index]
    ticket.update(assigned_to_user: agent_name, assigned_to_user_id: agent_index)
  end
end
