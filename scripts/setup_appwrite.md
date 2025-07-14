# Appwrite Setup Guide for Team Perseverance

## Project Configuration
- **Project ID**: `6874697700034c53cfecZ`
- **Endpoint**: `https://fra.cloud.appwrite.io/v1`
- **Database ID**: `perseverance_db`

## Step 1: Create Database
1. Go to [Appwrite Console](https://cloud.appwrite.io)
2. Select your project: `6874697700034c53cfecZ`
3. Navigate to **Databases** → **Create Database**
4. Set Database ID: `perseverance_db`
5. Set Name: `Perseverance Database`
6. Click **Create**

## Step 2: Create Collections

### Users Collection
1. Create collection with ID: `users`
2. Add attributes:
   - `userId` (String, 36 chars, required)
   - `fullName` (String, 64 chars, required)
   - `email` (String, 64 chars, required, unique)
   - `role` (String, 16 chars, required, enum: Coach, Captain, Member)
   - `teamId` (String, 36 chars)
   - `photoUrl` (String, 2048 chars)
   - `createdAt` (DateTime, required)
   - `lastActive` (DateTime)

### Teams Collection
1. Create collection with ID: `teams`
2. Add attributes:
   - `name` (String, 64 chars, required)
   - `code` (String, 16 chars, required, unique)
   - `ownerId` (String, 36 chars, required)
   - `members` (String array, 36 chars each, required)
   - `settings` (String, 1024 chars)
   - `createdAt` (DateTime, required)

### Tasks Collection
1. Create collection with ID: `tasks`
2. Add attributes:
   - `title` (String, 64 chars, required)
   - `description` (String, 512 chars)
   - `assignedTo` (String, 36 chars)
   - `teamId` (String, 36 chars, required)
   - `status` (String, 16 chars, required, enum: Pending, In Progress, Completed)
   - `priority` (String, 16 chars, required, enum: Low, Medium, High)
   - `dueDate` (DateTime)
   - `createdBy` (String, 36 chars, required)
   - `createdAt` (DateTime, required)
   - `completedAt` (DateTime)

### Build Logs Collection
1. Create collection with ID: `buildLogs`
2. Add attributes:
   - `title` (String, 64 chars, required)
   - `description` (String, 1024 chars, required)
   - `teamId` (String, 36 chars, required)
   - `version` (String, 16 chars, required)
   - `photos` (String array, 36 chars each)
   - `createdBy` (String, 36 chars, required)
   - `createdAt` (DateTime, required)

### Inventory Collection
1. Create collection with ID: `inventory`
2. Add attributes:
   - `name` (String, 64 chars, required)
   - `description` (String, 256 chars)
   - `quantity` (Integer, required, min: 0)
   - `location` (String, 64 chars)
   - `teamId` (String, 36 chars, required)
   - `category` (String, 32 chars, required)
   - `createdAt` (DateTime, required)
   - `updatedAt` (DateTime, required)

### Matches Collection
1. Create collection with ID: `matches`
2. Add attributes:
   - `teamId` (String, 36 chars, required)
   - `competitionId` (String, 36 chars, required)
   - `opponentTeam` (String, 36 chars, required)
   - `matchNumber` (String, 16 chars, required)
   - `alliance` (String, 8 chars, required, enum: Red, Blue)
   - `score` (Integer, min: 0)
   - `opponentScore` (Integer, min: 0)
   - `result` (String, 8 chars, required, enum: Win, Loss, Tie)
   - `notes` (String, 512 chars)
   - `scoutData` (String, 2048 chars)
   - `matchDate` (DateTime, required)
   - `createdBy` (String, 36 chars, required)

### Competitions Collection
1. Create collection with ID: `competitions`
2. Add attributes:
   - `name` (String, 64 chars, required)
   - `location` (String, 128 chars, required)
   - `startDate` (DateTime, required)
   - `endDate` (DateTime, required)
   - `description` (String, 512 chars)
   - `teams` (String array, 36 chars each)
   - `createdAt` (DateTime, required)

### Tools Collection
1. Create collection with ID: `tools`
2. Add attributes:
   - `name` (String, 64 chars, required)
   - `description` (String, 256 chars)
   - `teamId` (String, 36 chars, required)
   - `isAvailable` (Boolean, required)
   - `checkedOutBy` (String, 36 chars)
   - `checkedOutAt` (DateTime)
   - `createdAt` (DateTime, required)

### Meetings Collection
1. Create collection with ID: `meetings`
2. Add attributes:
   - `title` (String, 64 chars, required)
   - `description` (String, 512 chars)
   - `teamId` (String, 36 chars, required)
   - `scheduledDate` (DateTime, required)
   - `duration` (Integer, required, min: 1)
   - `location` (String, 64 chars)
   - `attendees` (String array, 36 chars each)
   - `notes` (String, 1024 chars)
   - `createdBy` (String, 36 chars, required)
   - `createdAt` (DateTime, required)

## Step 3: Create Storage Buckets
1. Navigate to **Storage** → **Create Bucket**
2. Create the following buckets:
   - `profile-photos` (Profile Photos)
   - `build-photos` (Build Photos)
   - `competition-photos` (Competition Photos)
   - `documents` (Documents)

## Step 4: Set Permissions
For each collection and bucket, set appropriate permissions:
- **Read**: `users` role
- **Write**: `users` role
- **Update**: `users` role
- **Delete**: `users` role (where appropriate)

## Step 5: Create Indexes
For each collection, create these indexes:

### Users Collection
- `teamId_index` (Key, attribute: teamId)
- `email_index` (Unique, attribute: email)

### Teams Collection
- `code_index` (Unique, attribute: code)
- `ownerId_index` (Key, attribute: ownerId)

### Tasks Collection
- `teamId_index` (Key, attribute: teamId)
- `assignedTo_index` (Key, attribute: assignedTo)
- `status_index` (Key, attribute: status)
- `dueDate_index` (Key, attribute: dueDate)

### Build Logs Collection
- `teamId_index` (Key, attribute: teamId)
- `createdAt_index` (Key, attribute: createdAt, order: DESC)

### Inventory Collection
- `teamId_index` (Key, attribute: teamId)
- `category_index` (Key, attribute: category)
- `name_index` (Key, attribute: name)

### Matches Collection
- `teamId_index` (Key, attribute: teamId)
- `competitionId_index` (Key, attribute: competitionId)
- `matchDate_index` (Key, attribute: matchDate, order: DESC)

### Competitions Collection
- `startDate_index` (Key, attribute: startDate)
- `endDate_index` (Key, attribute: endDate)

### Tools Collection
- `teamId_index` (Key, attribute: teamId)
- `isAvailable_index` (Key, attribute: isAvailable)

### Meetings Collection
- `teamId_index` (Key, attribute: teamId)
- `scheduledDate_index` (Key, attribute: scheduledDate)

## Step 6: Test Configuration
After setup, test the connection using the app. The configuration should work with the provided endpoint and project ID. 