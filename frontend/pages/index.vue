<template>
  <div class="container">
    <div>
      <h1 class="title">Zenn-app</h1>
      <h2 class="subtitle">
        {{ subTitle }}
      </h2>
      <button @click="getSomething">タスク取得だよーん</button>
      <ul v-for="post in posts" :key="post.id">
        <li style="text-align: left">{{ post.title }}</li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      subTitle: "Zenn is good service!!",
      posts: [],
    };
  },
  methods: {
    async getSomething() {
      // タスク一覧を取得するための API を叩く
      const response = await this.$axios.$get(
        "http://localhost:5000/api/v1/posts"
      );
      this.posts = JSON.parse(response.posts);
    },
  },
};
</script>