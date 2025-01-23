


<div align="center">
<br />
  <img src="WaybillRevenueService/Content/Logo.png" alt="logo" width="20%" style='border-radius: 5px;' height="auto" />
  <h1>Developer Scripts</h1>
  <p>
    An API to manage Customers and Accounts
  </p>
</div>

### :space_invader: Details

The API...

## :bat: Connection Settings

Set connection to connect to your MS SQL instance in the appsettings.json file.
NB: Entity Framework shall create the required Database and Tables.

```json
 "ConnectionStrings": {
    "databaseContext": "Server=localhost;Database=BankerAPI;User Id=sa;Password=xxxxx;TrustServerCertificate=True;"
  }
```

<br/>

## :eyes: Logging

Logging Text/Json file

```html
logs/logs-.txt

logs/logs-.json
```

<div align="center">
  <img src="WaybillRevenueService/Content/Logs.png" alt="logo" width="99%" style='border-radius: 5px;' height="auto" />
</div>
<br/>

## :fire: Entity Models

### Customer
```csharp
public class Customer : CoreModel
{
    [Key]
    public int Id { get; set; }

    public string FirstName { get; set; } = string.Empty;

    public string LastName { get; set; } = string.Empty;

    public string IdentificationNumber { get; set; } = string.Empty;
}
```

### Account
```csharp
public class Account : CoreModel
{
    [Key]
    public int Id { get; set; }

    public Customer Customer { get; set; }

    public string AccountNumber { get; set; } = string.Empty;

    public string AccountType { get; set; } = string.Empty;

    public double TotalBalance { get; set; }
}
```

### Transfer History
```csharp
public class TransferHistory : CoreModel
{
    [Key]
    public int Id { get; set; }

    public int FromCustomerId { get; set; }

    public int FromAccountId { get; set; }

    public int ToCustomerId { get; set; }

    public int ToAccountId { get; set; }

    public double TransferAmount { get; set; }
}
```

<br/>

## :bird: Util Models

### Service Envelope
```csharp
public class ServiceEnvelope<T>
{
    public int MessageCode { get; set; }

    public List<string> Messages { get; set; } = new List<string>();

    public T? Data { get; set; }

    public ServiceEnvelope()
    {
    }
}
```

### Core Model
```csharp
public class CoreModel
{
    public Guid CreatedBy { get; set; } = new Guid("8e4c7313-e3cd-4556-be01-56602945c049");

    public DateTime CreatedDate { get; set; } = DateTime.UtcNow;

    public Guid? ModifiedBy { get; set; } = null;

    public DateTime? ModifiedDate { get; set; } = null;

    public bool IsDeleted { get; set; } = false;
}
```

<br/>

## :dart: API

<div align="center">
  <img src="WaybillRevenueService/Content/Logs.png" alt="logo" width="99%" style='border-radius: 5px;' height="auto" />
</div>
<br/>

#### Customers
![Static Badge](https://img.shields.io/badge/POST-darkgreeen) ![Static Badge](https://img.shields.io/badge//v1/Customer-blue)  
![Static Badge](https://img.shields.io/badge/PUT-orange) ![Static Badge](https://img.shields.io/badge//v1/Customer-blue)  
![Static Badge](https://img.shields.io/badge/GET-indigo) ![Static Badge](https://img.shields.io/badge//v1/Customer-blue)  
![Static Badge](https://img.shields.io/badge/GET-indigo) ![Static Badge](https://img.shields.io/badge//v1/Customer/{CustomerId}-blue)  
![Static Badge](https://img.shields.io/badge/DELETE-maroon) ![Static Badge](https://img.shields.io/badge//v1/Customer/{CustomerId}-blue)  

### Customer
### <li><i style='color:green'>POST</i> - Create a Customer
```link
/v1/Customer 
```
REQUEST
```json
{
	"createdBy": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
	"firstName": "James",
	"lastName": "Bond",
	"identificationNumber": "JB19620101123"
}
```
RESPONSE
```json
{
	"statusCode": 201,
	"messages": [],
	"data": true
}
```

### <li><i style='color:orange'>PUT</i> - Update a Customer
```link
/v1/Customer/{CustomerId}
```
REQUEST
```json
{
	"modifiedBy": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
	"id": 1,
	"firstName": "James II",
	"lastName": "Bond II",
	"identificationNumber": "JB19620101123"
}
```
RESPONSE
```json
{
	"messageCode": 200,
	"messages": [],
	"data": true
}
```

### <li><i style='color:red'>DELETE</i> - Delete a Customer
```link
/v1/Customer/{CustomerId}
```
REQUEST
```json
No request
```
RESPONSE
```json
{
	"messageCode": 200,
	"messages": [],
	"data": true
}
```

### <li><i style='color:indigo'>GET</i> - Get all Customers
```link
/v1/Customer
```
REQUEST
```json
no request
```
RESPONSE
```json
{
	"messageCode": 200,
	"messages": [],
	"data": [
		{
			"id": 1,
			"firstName": "James II",
			"lastName": "Bond II",
			"identificationNumber": "JB19620101123",
			"createdBy": "00000000-0000-0000-0000-000000000000",
			"createdDate": "2024-04-28T15:07:52.5142137",
			"modifiedBy": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
			"modifiedDate": null,
			"isDeleted": false
		},
		{
			"id": 3,
			"firstName": "Mitch",
			"lastName": "Buchannon",
			"identificationNumber": "44336622771",
			"createdBy": "8e4c7313-e3cd-4556-be01-56602945c049",
			"createdDate": "2024-04-28T14:56:09.6911176",
			"modifiedBy": null,
			"modifiedDate": null,
			"isDeleted": false
		},
		{
			"id": 2,
			"firstName": "Michael",
			"lastName": "Knight",
			"identificationNumber": "9988665533221",
			"createdBy": "8e4c7313-e3cd-4556-be01-56602945c049",
			"createdDate": "2024-04-28T14:56:09.6911171",
			"modifiedBy": null,
			"modifiedDate": null,
			"isDeleted": false
		}
	]
}
```

### <li><i style='color:indigo'>GET</i> - Get a Customer
```link
/v1/Customer/{CustomerId}
```
REQUEST
```json
No request
```
RESPONSE
```json
{
	"messageCode": 200,
	"messages": [],
	"data": {
		"id": 1,
		"firstName": "James II",
		"lastName": "Bond II",
		"identificationNumber": "JB19620101123",
		"createdBy": "00000000-0000-0000-0000-000000000000",
		"createdDate": "2024-04-28T15:07:52.5142137",
		"modifiedBy": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
		"modifiedDate": null,
		"isDeleted": false
	}
}
```
##
### Account
### <li><i style='color:green'>POST</i> - Create a Account
```link
/v1/Account
```
REQUEST
```json
{
	"createdBy": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
	"customer": {
		"modifiedBy": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
		"id": 1,
		"firstName": "James I",
		"lastName": "Bond I",
		"identificationNumber": "JB19620101123"
	},
	"accountNumber": "ACC00123",
	"accountType": "Savings",
	"totalBalance": 9000.00
}
```
RESPONSE
```json
{
	"statusCode": 201,
	"messages": [],
	"data": true
}
```

### <li><i style='color:orange'>PUT</i> - Update a Account
```link
/v1/Account/{AccountId}
```
REQUEST
```json
{
	"id": 1,
	"modifiedBy": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
	"customer": {
		"modifiedBy": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
		"id": 1,
		"firstName": "James I",
		"lastName": "Bond I",
		"identificationNumber": "JB19620101123"
	},
	"accountNumber": "ACC002",
	"accountType": "Check"
}
```
RESPONSE
```json
{
	"messageCode": 200,
	"messages": [],
	"data": true
}
```

### <li><i style='color:red'>DELETE</i> - Delete a Account
```link
/v1/Account/{AccountId}
```
REQUEST
```json
No request
```
RESPONSE
```json
{
	"messageCode": 200,
	"messages": [],
	"data": true
}
```

### <li><i style='color:indigo'>GET</i> - Get all Accounts
```link
/v1/Account
```
REQUEST
```json
no request
```
RESPONSE
```json
{
	"messageCode": 200,
	"messages": [],
	"data": [
		{
			"id": 1,
			"customer": {
				"id": 1,
				"firstName": "James I",
				"lastName": "Bond I",
				"identificationNumber": "JB19620101123",
				"createdBy": "00000000-0000-0000-0000-000000000000",
				"createdDate": "2024-04-28T16:20:12.7095277",
				"modifiedBy": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
				"modifiedDate": null,
				"isDeleted": false
			},
			"accountNumber": "ACC002",
			"accountType": "Check",
			"totalBalance": 0,
			"createdBy": "00000000-0000-0000-0000-000000000000",
			"createdDate": "2024-04-28T16:22:45.3362037",
			"modifiedBy": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
			"modifiedDate": null,
			"isDeleted": false
		},
		{
			"id": 2,
			"customer": {
				"id": 1,
				"firstName": "James I",
				"lastName": "Bond I",
				"identificationNumber": "JB19620101123",
				"createdBy": "00000000-0000-0000-0000-000000000000",
				"createdDate": "2024-04-28T16:20:12.7095277",
				"modifiedBy": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
				"modifiedDate": null,
				"isDeleted": false
			},
			"accountNumber": "100002",
			"accountType": "Check Account",
			"totalBalance": 1000,
			"createdBy": "8e4c7313-e3cd-4556-be01-56602945c049",
			"createdDate": "2024-04-28T15:52:08.4943915",
			"modifiedBy": null,
			"modifiedDate": null,
			"isDeleted": false
		}
	]
}
```

### <li><i style='color:indigo'>GET</i> - Get a Account
```link
/v1/Account/{AccountId}
```
REQUEST
```json
No request
```
RESPONSE
```json
{
	"messageCode": 200,
	"messages": [],
	"data": {
		"id": 1,
		"customer": {
			"id": 1,
			"firstName": "James I",
			"lastName": "Bond I",
			"identificationNumber": "JB19620101123",
			"createdBy": "00000000-0000-0000-0000-000000000000",
			"createdDate": "2024-04-28T16:20:12.7095277",
			"modifiedBy": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
			"modifiedDate": null,
			"isDeleted": false
		},
		"accountNumber": "ACC002",
		"accountType": "Check",
		"totalBalance": 0,
		"createdBy": "00000000-0000-0000-0000-000000000000",
		"createdDate": "2024-04-28T16:22:45.3362037",
		"modifiedBy": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
		"modifiedDate": null,
		"isDeleted": false
	}
}
```

### <li><i style='color:indigo'>GET</i> - Get Accounts by Customer
```link
/v1/Account/Customer/{CustomerId}
```
REQUEST
```json
No request
```
RESPONSE
```json
{
	"messageCode": 200,
	"messages": [],
	"data": [
		{
			"id": 1,
			"customer": {
				"id": 1,
				"firstName": "James I",
				"lastName": "Bond I",
				"identificationNumber": "JB19620101123",
				"createdBy": "00000000-0000-0000-0000-000000000000",
				"createdDate": "2024-04-28T16:20:12.7095277",
				"modifiedBy": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
				"modifiedDate": null,
				"isDeleted": false
			},
			"accountNumber": "ACC002",
			"accountType": "Check",
			"totalBalance": 0,
			"createdBy": "00000000-0000-0000-0000-000000000000",
			"createdDate": "2024-04-28T16:22:45.3362037",
			"modifiedBy": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
			"modifiedDate": null,
			"isDeleted": true
		},
		{
			"id": 2,
			"customer": {
				"id": 1,
				"firstName": "James I",
				"lastName": "Bond I",
				"identificationNumber": "JB19620101123",
				"createdBy": "00000000-0000-0000-0000-000000000000",
				"createdDate": "2024-04-28T16:20:12.7095277",
				"modifiedBy": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
				"modifiedDate": null,
				"isDeleted": false
			},
			"accountNumber": "100002",
			"accountType": "Check Account",
			"totalBalance": 1000,
			"createdBy": "8e4c7313-e3cd-4556-be01-56602945c049",
			"createdDate": "2024-04-28T15:52:08.4943915",
			"modifiedBy": null,
			"modifiedDate": null,
			"isDeleted": false
		}
	]
}
```

### <li><i style='color:green'>POST</i> - Transfer Amounts
```link
/v1/Account/TransferAmount
```
REQUEST
```json
{
	"fromCustomerId": 1,
	"fromAccountId": 1,
	"toCustomerId": 3,
	"toAccountId": 6,
	"transferAmount": 100
}
```
RESPONSE
```json
{
	"messageCode": 200,
	"messages": [],
	"data": true
}
```

### <li><i style='color:indigo'>GET</i> - Transfer History
```html
/v1/Account/TransferHistory/{AccountId}
```
REQUEST
```json
No request
```
RESPONSE
```json
{
	"messageCode": 200,
	"messages": [],
	"data": [
		{
			"id": 1,
			"fromCustomerId": 1,
			"fromAccountId": 1,
			"toCustomerId": 1,
			"toAccountId": 2,
			"transferAmount": 100,
			"createdBy": "00000000-0000-0000-0000-000000000000",
			"createdDate": "2024-04-28T19:19:07.3388268",
			"modifiedBy": null,
			"modifiedDate": null,
			"isDeleted": false
		},
		{
			"id": 2,
			"fromCustomerId": 1,
			"fromAccountId": 1,
			"toCustomerId": 1,
			"toAccountId": 2,
			"transferAmount": 100,
			"createdBy": "00000000-0000-0000-0000-000000000000",
			"createdDate": "2024-04-28T19:19:08.6036335",
			"modifiedBy": null,
			"modifiedDate": null,
			"isDeleted": false
		}
	]
}
```

##
