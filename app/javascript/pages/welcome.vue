<template>
    <div>
        <h3>{{ weclomeText }}</h3>
        <p>
            The app contains skelethon and initial configurations for single page app using Vue JS.
        </p>

        <div>
            <p>
                Explore:
            </p>
            <ul>
                <li>
                    <router-link to="/dashboard">Dashboard</router-link>
                </li>
                <li>
                    <router-link to="/users">Users</router-link>
                </li>
            </ul>
        </div>
    </div>
</template>

<script>
    export default {
        data: function () {
            return {
                weclomeText: "-- Welcome to Rails Vue Example app --"
            }
        }
    }
</script>