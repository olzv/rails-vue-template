<template>
    <div>
        {{ lastCreatedUser }}
        <create v-on:user-created="onUserCreated"></create>
        <br>
        <list :key="lastCreatedUser.first_name"></list>
    </div>
</template>

<script>
    import create from '@components/users/create'
    import list from '@components/users/list'

    export default {
        components: {
            create,
            list
        },

        data() {
            return {
                lastCreatedUser: {
                    first_name: null
                }
            }
        },

        methods: {
            onUserCreated(user) {
                this.lastCreatedUser = user;
            }
        }
    }
</script>