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
      chamber: Ohio.Chamber.house,
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

  def senate_bill_factory do
    bill_num = sequence("")

    %Ohio.Bill{
      chamber: Ohio.Chamber.senate,
      name: "S.B. No. #{bill_num}",
      short_title: "Bettering the World for the #{bill_num}st/th Time",
      long_title: "To enact section #{:rand.uniform * 10000} of the Ohio Revised code to Better the World for the #{bill_num}th Time",
      number: "sb#{bill_num}",
      version: "As Introduced",
      version_id: "IN",
      revno: :rand.uniform(100_000),
      formatted_ver: "00",
      apn: "chamber/132nd_ga/ready_for_publication/bills/sb100/00_IN/sb100_00_IN.html",
      local_impact_statement: "No - Minimal cost",
      govsigned: nil,
      concurrence: nil,
      effective_date: nil,
      effective_date_notes: "",
      api_link: "/solarapi/v1/general_assembly_132/bills/sb100/IN/00",
      pdf_download_link: "/solarapi/v1/general_assembly_132/bills/sb100/IN/00?format=pdf",
      html_download_link: "/solarapi/v1/general_assembly_132/bills/sb100/IN/00?format=html"
    }
  end

  # Legislators, Committees, and Assignments
  def house_committee_factory do
    %Ohio.Committee{
      name: sequence("Sample Committee for the Oversight of "),
      chamber: Ohio.Chamber.house,
      revno: :rand.uniform(100_000),
      active: true,
      api_link: sequence("/solarapi/v1/general_assembly_132/committees/cmte_h_go_")
    }
  end

  def senate_committee_factory do
    %Ohio.Committee{
      name: sequence("Sample Committee for the Oversight of "),
      chamber: Ohio.Chamber.senate,
      revno: :rand.uniform(100_000),
      active: true,
      api_link: sequence("/solarapi/v1/general_assembly_132/committees/cmte_h_go_")
    }
  end

  def house_legislator_factory do
    %Ohio.Legislator{
      chamber: Ohio.Chamber.house,
      firstname: "First",
      lastname: sequence("Last"),
      lpid: sequence("rep_first_last_"),
      district: sequence(""),
      med_id: :rand.uniform(10_000),
      position: "position_h_representative_1",
      displayname: sequence("First Q. Last "),
      sponsorname: sequence("Last "),
      aemembsponsor: sequence("Rep. Last "),
      revno: :rand.uniform(100_000),
      apn: sequence("chamber/132nd_ga/system/reps/rep_first_last_"),
      active: true,
      api_link: sequence("/solarapi/v1/general_assembly_132/legislators/rep_first_last_1"),
      partyid: "party_republican_1"
    }
  end

  def senate_legislator_factory do
    %Ohio.Legislator{
      chamber: Ohio.Chamber.senate,
      firstname: "First",
      lastname: sequence("Last"),
      lpid: sequence("sen_first_last_"),
      district: sequence(""),
      med_id: :rand.uniform(10_000),
      position: "position_s_senator_1",
      displayname: sequence("First N. Last "),
      sponsorname: sequence("Last "),
      aemembsponsor: sequence("Sen. Last "),
      revno: :rand.uniform(100_000),
      apn: sequence("chamber/132nd_ga/system/sens/sen_first_last_") <> ".html",
      active: true,
      api_link: sequence("/solarapi/v1/general_assembly_132/legislators/sen_first_last_1"),
      partyid: "party_democrat_1"
    }
  end

  def house_assignment_factory do
    %Ohio.Assignment{
      legislator: build(:house_legislator),
      committee: build(:house_committee)
    }
  end

  def house_resolution_factory do
    res_num = sequence("")

    %Ohio.Resolution{
      chamber: Ohio.Chamber.house,
      name: "H.R. No. #{res_num}",
      short_title: "Bettering the House for the #{res_num}st/th Time",
      long_title: "To enact section #{:rand.uniform * 10000} of the Ohio Revised code to Better the House for the #{res_num}th Time",
      number: "hr#{res_num}",
      version: "As Introduced",
      version_id: "IN",
      revno: :rand.uniform(100_000),
      formatted_ver: "00",
      apn: "chamber/132nd_ga/ready_for_publication/resolutions/hr100/00_IN/hr100_00_IN.html",
      govsigned: nil,
      concurrence: nil,
      effective_date: nil,
      effective_date_notes: "",
      api_link: "/solarapi/v1/general_assembly_132/resolutions/hr100/IN/00",
      pdf_download_link: "/solarapi/v1/general_assembly_132/resolutions/hr100/IN/00?format=pdf",
      html_download_link: "/solarapi/v1/general_assembly_132/resolutions/hr100/IN/00?format=html"
    }
  end

  def senate_resolution_factory do
    res_num = sequence("")

    %Ohio.Resolution{
      chamber: Ohio.Chamber.senate,
      name: "S.R. No. #{res_num}",
      short_title: "Bettering the Senate for the #{res_num}st/th Time",
      long_title: "To enact section #{:rand.uniform * 10000} of the Ohio Revised code to Better the Senate for the #{res_num}th Time",
      number: "sr#{res_num}",
      version: "As Introduced",
      version_id: "IN",
      revno: :rand.uniform(100_000),
      formatted_ver: "00",
      apn: "chamber/132nd_ga/ready_for_publication/resolutions/sr100/00_IN/sr100_00_IN.html",
      govsigned: nil,
      concurrence: nil,
      effective_date: nil,
      effective_date_notes: "",
      api_link: "/solarapi/v1/general_assembly_132/resolutions/sr100/IN/00",
      pdf_download_link: "/solarapi/v1/general_assembly_132/resolutions/sr100/IN/00?format=pdf",
      html_download_link: "/solarapi/v1/general_assembly_132/resolutions/sr100/IN/00?format=html"
    }
  end
end
