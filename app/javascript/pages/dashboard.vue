<template>
    <div>
        <div>
            <h3>Welcome to Dashboard!</h3>
            <p>
                Here is some data for you:
                {{ someData }}
            </p>
        </div>
    </div>
</template>

<script>
    export default {
        data: function () {
            return {
                someData: "Some data on the dashboard!"
            }
        }
    }
</script>