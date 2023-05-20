{{/* vim: set filetype=mustache: */}}

{{/*
WordPress Project Skeleton Image.
*/}}
{{- define "wp-project-skeleton.image" -}}
{{- printf "%s/%s:%s" .Values.image.registry .Values.image.repository .Values.image.tag -}}
{{- end -}}

{{/*
NGINX Image.
*/}}
{{- define "wp-project-skeleton.nginx.image" -}}
{{- printf "%s:%s" "nginx" .Values.nginx.image.tag -}}
{{- end -}}

{{/*
Default AWS region.
*/}}
{{- define "wp-project-skeleton.awsRegion" -}}
{{- $key := index . 0 -}}
{{- $value := index . 1 -}}
{{- if $value -}}
{{ $key }}: {{ $value }}
{{- else -}}
{{ $key }}: {{ .Values.app.awsRegion | quote }}
{{- end -}}
{{- end -}}
