param workspace string

@description('Unique id for the watchlist')
@minLength(1)
param watchlist_id string = 'a1c18f90-7152-4d3c-bf0c-e2b0c3e1a5d7'

resource workspaceResource 'Microsoft.OperationalInsights/workspaces@2022-10-01' existing = {
  name: workspace
}

resource watchlist 'Microsoft.SecurityInsights/watchlists@2022-11-01' = {
  scope: workspaceResource
  name: watchlist_id
  properties: {
    displayName: 'High Value Assets'
    description: 'A sample watchlist that tracks critical assets in your organization, including servers, workstations, and network devices that require priority monitoring.'
    provider: 'Microsoft'
    source: 'SampleHighValueAssets.csv'
    itemsSearchKey: 'IPAddress'
    contentType: 'text/csv'
    numberOfLinesToSkip: 0
    rawContent: 'IPAddress,HostName,AssetType,Department,Priority\n10.0.0.1,DC-PRIMARY,DomainController,IT,Critical\n10.0.0.5,SQL-PROD-01,DatabaseServer,Finance,Critical\n10.0.1.10,WEB-FRONTEND,WebServer,Engineering,High\n10.0.2.20,FILE-SERVER,FileServer,HR,High\n10.0.3.15,DEV-WORKSTATION,Workstation,Engineering,Medium'
    watchlistAlias: 'HighValueAssets'
  }
}
