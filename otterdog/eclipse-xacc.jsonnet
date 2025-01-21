local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('science.xacc', 'eclipse-xacc') {
  settings+: {
    description: "",
    name: "Eclipse XACC",
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('xacc') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "python"
      ],
      code_scanning_default_setup_enabled: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "XACC - eXtreme-scale Accelerator programming framework",
      homepage: "https://xacc.readthedocs.io",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
    },
  ],
}
