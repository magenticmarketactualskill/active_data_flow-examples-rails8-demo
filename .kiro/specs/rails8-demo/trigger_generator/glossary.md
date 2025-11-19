# Glossary - Trigger Generator

## Core Components

- **Trigger_Generator**: A Rails generator tool that creates and manages triggers for DataFlow execution
- **Trigger**: An automated mechanism that initiates DataFlow execution based on specific conditions or events
- **DataFlow**: An ActiveDataflow process that reads, transforms, and writes data

## Trigger Types

- **Scheduled_Trigger**: A trigger that executes a DataFlow at specified time intervals using Rails Solid Queue recurring jobs
- **Webhook_Trigger**: A trigger that executes a DataFlow when an HTTP POST request is received at a specific endpoint
- **Database_Trigger**: A trigger that executes a DataFlow when database events occur (create, update, delete) on specific models
- **Event_Trigger**: A trigger that executes a DataFlow when application events are published via ActiveSupport::Notifications

## Configuration Components

- **Schedule_Expression**: A time-based expression defining when a Scheduled_Trigger should execute (e.g., "every 5 minutes", "at 3am every day")
- **Webhook_Endpoint**: The HTTP URL path where a Webhook_Trigger accepts requests
- **Callback_Event**: The ActiveRecord lifecycle event that activates a Database_Trigger (after_create, after_update, after_destroy, after_commit)
- **Event_Subscription**: The registration of an Event_Trigger to listen for specific application events

## Execution Components

- **Trigger_Execution**: A single instance of a trigger running and invoking its associated DataFlow
- **Retry_Logic**: The mechanism that automatically re-attempts failed DataFlow executions with exponential backoff
- **Error_Handler**: The component that catches and processes exceptions during trigger execution
- **Execution_Metrics**: Performance and status data collected during trigger execution (execution time, success/failure, resource usage)
