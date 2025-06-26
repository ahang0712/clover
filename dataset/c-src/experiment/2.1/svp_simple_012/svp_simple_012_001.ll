; ModuleID = 'svp_simple_012_001.bc'
source_filename = "./svp_simple_012_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_012_001_global_var = common global i32 0, align 4
@svp_simple_012_001_global_pointer = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_012_001_main() #0 !dbg !7 {
  %1 = alloca i32*, align 8
  call void (...) @init(), !dbg !10
  %2 = bitcast i32** %1 to i8*, !dbg !11
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #3, !dbg !11
  store i32* @svp_simple_012_001_global_var, i32** %1, align 8, !dbg !12, !tbaa !13
  store i32 1, i32* @svp_simple_012_001_global_var, align 4, !dbg !17, !tbaa !18
  %3 = load i32*, i32** %1, align 8, !dbg !20, !tbaa !13
  store i32 2, i32* %3, align 4, !dbg !21, !tbaa !18
  %4 = bitcast i32** %1 to i8*, !dbg !22
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %4) #3, !dbg !22
  ret void, !dbg !22
}

declare void @init(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_012_001_isr_1() #0 !dbg !23 {
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*, !dbg !24
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3, !dbg !24
  %3 = load i32, i32* @svp_simple_012_001_global_var, align 4, !dbg !25, !tbaa !18
  store i32 %3, i32* %1, align 4, !dbg !26, !tbaa !18
  %4 = bitcast i32* %1 to i8*, !dbg !27
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %4) #3, !dbg !27
  ret void, !dbg !27
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_012_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_012")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_012_001_main", scope: !8, file: !8, line: 23, type: !9, scopeLine: 23, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_012_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_012")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 24, column: 3, scope: !7)
!11 = !DILocation(line: 25, column: 3, scope: !7)
!12 = !DILocation(line: 25, column: 8, scope: !7)
!13 = !{!14, !14, i64 0}
!14 = !{!"any pointer", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !DILocation(line: 27, column: 33, scope: !7)
!18 = !{!19, !19, i64 0}
!19 = !{!"int", !15, i64 0}
!20 = !DILocation(line: 29, column: 4, scope: !7)
!21 = !DILocation(line: 29, column: 6, scope: !7)
!22 = !DILocation(line: 30, column: 1, scope: !7)
!23 = distinct !DISubprogram(name: "svp_simple_012_001_isr_1", scope: !8, file: !8, line: 32, type: !9, scopeLine: 32, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!24 = !DILocation(line: 33, column: 3, scope: !23)
!25 = !DILocation(line: 34, column: 13, scope: !23)
!26 = !DILocation(line: 34, column: 11, scope: !23)
!27 = !DILocation(line: 35, column: 1, scope: !23)
