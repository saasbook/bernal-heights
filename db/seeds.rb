# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Admin.destroy_all
admin = CreateAdminService.new.call(ENV['ADMIN_EMAIL'], ENV['ADMIN_PASSWORD'], ENV['ADMIN_NAME'])
if admin
  puts 'CREATED ADMIN USER: ' << admin.name
end

observer = CreateAdminService.new.call(ENV['OBSERVER_EMAIL'], ENV['OBSERVER_PASSWORD'], ENV['OBSERVER_NAME'])
if observer
  puts 'CREATED OBSERVER ACCT ' << observer.name
end

bh_admin = CreateAdminService.new.call(ENV['BH_EMAIL'], ENV['BH_PASSWORD'], ENV['BH_NAME'])
if bh_admin
  puts 'CREATED BHNC ACCT ' << bh_admin.name
end

Issue.create(issue_type: "Car Break-In")
Issue.create(issue_type: "Abandoned Car")
Issue.create(issue_type: "Broken Streetlight")
Issue.create(issue_type: "Illegal Drug Transactions")
Issue.create(issue_type: "Litter/Dumping Trash")
Issue.create(issue_type: "Public Drinking and Noise")
Issue.create(issue_type: "Other")

Resource.create(title:"SFPD Online Reporting System", description:"Report minor
crimes such as theft and graffiti", phone:"", link:"http://www.sfpolice.org/index.aspx?page=778", kind:1)
Resource.create(title:"Ingleside Police Station", description:"Located at 1 Sgt John V
Young Lane, inside Balboa Park", phone:"", link:"", kind:1)
Resource.create(title:"Ingleside Front Desk", description:"File a report or speak
directly to an officer", phone:"404-4000", link:"", kind:1)
Resource.create(title:"Ingleside anonymous tip line", description:"Leave a voicemail
message.", phone:"404-4035 ", link:"", kind:1)
Resource.create(title:"Bike registration program", description:"Register bikes now to
aid recovery if stolen later", phone:"", link:"http://www.inglesidepolicestation.com/#!__bike-registration", kind:1)


Resource.create(title:"Ingleside Police Station website", description:" e-mail news-letter
summarizes crime, comes out 1-5x/week", phone:"", link:"http://www.inglesidepolicestation.com/", kind:2)
Resource.create(title:"BernalSafe Yahoo group", description:"Active group focused on safety concerns. ", phone:"", link:"www.bernalsafe.yahoogroups.com ", kind:2)
Resource.create(title:"Bernalwood blog", description:"Neighborhood news, including crime & safety", phone:"", link:"http://www.bernalwood.wordpress.com/", kind:2)

Resource.create(title:"AlertSF", description:"Sign up to receive text messages during
emergencies", phone:"", link:"https://alertsf.org/", kind:2)

Resource.create(title:"SF SAFE Neighborhood watch groups", description:"Join or start one", phone:"673-SAFE", link:"http://www.sfsafe.org/services/neighborhood-watch", kind:3)
Resource.create(title:"Neighborhood Emergency Response Team
(NERT)", description:"Learn hands-on skills to prepare for
and help after disasters", phone:"", link:"http://www.sf-fire.org/index.aspx?page=859", kind:3)
Resource.create(title:"Auxiliary Law Enforcement Response Team (ALERT).", description:"Train to help police after earthquakes
or other emergencies; must be NERT-certified", phone:"", link:"http://www.sf-police.org/index.aspx?page=4019", kind:3)
Resource.create(title:"Prepare for the Big One", description:"", phone:"", link:"http://www.72hours.org/", kind:3)

Resource.create(title:"Neighborhood Courts", description:"Become a volunteer adjudicator using restorative justice", phone:"", link:"http://www.sfdistrictattorney.org/index.aspx?page=178", kind:3)
Resource.create(title:"Recycle", description:"-Recology offers 2 free \"Recycle My Junk\" pickups (10 items each) per year", phone:"330-1300", link:"http://www.recyclemyjunk.com/", kind:3)


Resource.create(title:"Supervisor David Campos (D9, most of Bernal Heights)", description:"Aides: Hillary Ronen and Nate Albee", phone:"554-5144", link:"david.campos@sfgov.org", kind:4)
Resource.create(title:"Supervisor Scott Wiener (D8, Bernal Cut)", description:"Aides: Andres Power, Adam Taylor, Jeff Cretan", phone:"554-6968", link:"scott.wiener@sfgov.org", kind:4)
Resource.create(title:"Ailed Paningbatan", description:"Dir. Community Engagement", phone:"206-2140 ext.130", link:"apaningbatan@bhnc.org", kind:4)
Resource.create(title:"Amber Orantes", description:"Public Safety Coordinator", phone:"206-2140 ext.176 ", link:"aorantes@bhnc.org", kind:4)


Resource.create(title:"Bernal Business Alliance", description:"", phone:"", link:"http://www.bernalbusiness.org/", kind:4)
Resource.create(title:"Rani Singh", description:"Assistant District Attorney for Ingleside", phone:"", link:"rani.singh@sfgov.org", kind:4)
Resource.create(title:"Jennifer Choi", description:"Deputy City Attorney for Ingleside", phone:"", link:"jennifer.choi@sfgov.org", kind:4)
Resource.create(title:"Sarah Rogers", description:"Ingleside Community Police Advisory Board Bernal Rep", phone:"", link:"serogers@yahoo.com", kind:4)
# Resource.create(title:"", description:"", phone:"", link:"", kind:)

