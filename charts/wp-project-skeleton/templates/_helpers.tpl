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
{{- $default := index . 2 -}}
{{- if $value -}}
{{ $key }}: {{ $value | quote }}
{{- else -}}
{{ $key }}: {{ $default | quote }}
{{- end -}}
{{- end -}}

{{/*
Project internal name.
*/}}
{{- define "wp-project-skeleton.name" -}}
{{- $name := hasSuffix "-stage" .Release.Name | ternary (trimSuffix "-stage" .Release.Name) (trimSuffix "-prod" .Release.Name) -}}
{{- printf "%s" $name -}}
{{- end -}}

{{/*
Default S3 bucket.
*/}}
{{- define "wp-project-skeleton.s3Bucket" }}
{{- $subPath := hasSuffix "-stage" .Release.Name | ternary "/stage" "" -}}
{{- printf "media.wpd.digital/%s%s" (include "wp-project-skeleton.name" .) $subPath -}}
{{- end -}}
