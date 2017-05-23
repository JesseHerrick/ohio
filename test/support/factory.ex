defmodule Ohio.Factory do
  use ExMachina.Ecto, repo: Ohio.Repo

  # Model: Chamber
  def house_factory do
    %Ohio.Chamber{
      name: "House"
    }
  end

  def senate_factory do
    %Ohio.Chamber{
      name: "Senate"
    }
  end

  # Model: Bill
  def house_bill_factory do
    bill_num = sequence("")

    %Ohio.Bill{
      chamber: build(:house),
      name: "H.B. No. #{bill_num}",
      short_title: "Bettering the World for the #{bill_num}st/th Time",
      long_title: "To enact section #{:rand.uniform * 10000} of the Ohio Revised code to Better the World for the #{bill_num}th Time",
      number: "hb#{bill_num}",
      version: "As Introduced",
      version_id: "IN",
      revno: :rand.uniform(100000),
      formatted_ver: "00",
      apn: "chamber/132nd_ga/ready_for_publication/bills/hb100/00_IN/hb100_00_IN.html",
      local_impact_statement: "No - Minimal cost",
      govsigned: nil,
      concurrence: nil,
      effective_date: nil,
      effective_date_notes: "",
      api_link: "/solarapi/v1/general_assembly_132/bills/hb100/IN/00",
      pdf_download_link: "/solarapi/v1/general_assembly_132/bills/hb100/IN/00?format=pdf",
      html_download_link: "/solarapi/v1/general_assembly_132/bills/hb100/IN/00?format=html"
    }
  end

  def chamber_factory do
  end

  def committee_factory do

  end

  def legislator_factory do

  end

  def resolution_factory do

  end

  def vote_factory do
  end
end
