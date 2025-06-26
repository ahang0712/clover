; ModuleID = 'svp_simple_018_001-opt.bc'
source_filename = "./svp_simple_018_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_018_001_para1 = common global float 0.000000e+00, align 4
@svp_simple_018_001_para2 = common global float 0.000000e+00, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_018_001_main() #0 !dbg !7 {
  call void (...) @init(), !dbg !10
  %1 = load volatile float, float* @svp_simple_018_001_para1, align 4, !dbg !11, !tbaa !14
  %2 = fmul float 2.000000e+00, %1, !dbg !18
  %3 = load volatile float, float* @svp_simple_018_001_para2, align 4, !dbg !19, !tbaa !14
  %4 = fmul float %2, %3, !dbg !20
  %5 = load volatile float, float* @svp_simple_018_001_para1, align 4, !dbg !21, !tbaa !14
  %6 = load volatile float, float* @svp_simple_018_001_para2, align 4, !dbg !24, !tbaa !14
  %7 = fmul float %5, %6, !dbg !25
  %8 = load volatile float, float* @svp_simple_018_001_para2, align 4, !dbg !26, !tbaa !14
  %9 = fmul float %7, %8, !dbg !27
  ret void, !dbg !28
}

declare void @init(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define float @svp_simple_018_001_func1() #0 !dbg !12 {
  %1 = load volatile float, float* @svp_simple_018_001_para1, align 4, !dbg !29, !tbaa !14
  %2 = fmul float 2.000000e+00, %1, !dbg !30
  %3 = load volatile float, float* @svp_simple_018_001_para2, align 4, !dbg !31, !tbaa !14
  %4 = fmul float %2, %3, !dbg !32
  ret float %4, !dbg !33
}

; Function Attrs: nounwind uwtable
define float @svp_simple_018_001_func2() #0 !dbg !22 {
  %1 = load volatile float, float* @svp_simple_018_001_para1, align 4, !dbg !34, !tbaa !14
  %2 = load volatile float, float* @svp_simple_018_001_para2, align 4, !dbg !35, !tbaa !14
  %3 = fmul float %1, %2, !dbg !36
  %4 = load volatile float, float* @svp_simple_018_001_para2, align 4, !dbg !37, !tbaa !14
  %5 = fmul float %3, %4, !dbg !38
  ret float %5, !dbg !39
}

; Function Attrs: nounwind uwtable
define void @svp_simple_018_001_isr_func1() #0 !dbg !40 {
  store volatile float 1.000000e+00, float* @svp_simple_018_001_para2, align 4, !dbg !41, !tbaa !14
  ret void, !dbg !42
}

; Function Attrs: nounwind uwtable
define void @svp_simple_018_001_isr_1() #0 !dbg !43 {
  call void (...) @idlerun(), !dbg !44
  store volatile float 2.000000e+00, float* @svp_simple_018_001_para1, align 4, !dbg !45, !tbaa !14
  ret void, !dbg !46
}

declare void @idlerun(...) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_018_001_isr_2() #0 !dbg !47 {
  call void (...) @idlerun(), !dbg !48
  store volatile float 1.000000e+00, float* @svp_simple_018_001_para2, align 4, !dbg !49, !tbaa !14
  ret void, !dbg !51
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_018_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_018")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_018_001_main", scope: !8, file: !8, line: 30, type: !9, scopeLine: 30, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_018_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_018")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 31, column: 3, scope: !7)
!11 = !DILocation(line: 40, column: 18, scope: !12, inlinedAt: !13)
!12 = distinct !DISubprogram(name: "svp_simple_018_001_func1", scope: !8, file: !8, line: 38, type: !9, scopeLine: 38, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = distinct !DILocation(line: 34, column: 33, scope: !7)
!14 = !{!15, !15, i64 0}
!15 = !{!"float", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C/C++ TBAA"}
!18 = !DILocation(line: 40, column: 16, scope: !12, inlinedAt: !13)
!19 = !DILocation(line: 41, column: 14, scope: !12, inlinedAt: !13)
!20 = !DILocation(line: 40, column: 43, scope: !12, inlinedAt: !13)
!21 = !DILocation(line: 47, column: 10, scope: !22, inlinedAt: !23)
!22 = distinct !DISubprogram(name: "svp_simple_018_001_func2", scope: !8, file: !8, line: 45, type: !9, scopeLine: 45, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!23 = distinct !DILocation(line: 35, column: 29, scope: !7)
!24 = !DILocation(line: 48, column: 10, scope: !22, inlinedAt: !23)
!25 = !DILocation(line: 47, column: 35, scope: !22, inlinedAt: !23)
!26 = !DILocation(line: 49, column: 10, scope: !22, inlinedAt: !23)
!27 = !DILocation(line: 48, column: 35, scope: !22, inlinedAt: !23)
!28 = !DILocation(line: 36, column: 1, scope: !7)
!29 = !DILocation(line: 40, column: 18, scope: !12)
!30 = !DILocation(line: 40, column: 16, scope: !12)
!31 = !DILocation(line: 41, column: 14, scope: !12)
!32 = !DILocation(line: 40, column: 43, scope: !12)
!33 = !DILocation(line: 42, column: 3, scope: !12)
!34 = !DILocation(line: 47, column: 10, scope: !22)
!35 = !DILocation(line: 48, column: 10, scope: !22)
!36 = !DILocation(line: 47, column: 35, scope: !22)
!37 = !DILocation(line: 49, column: 10, scope: !22)
!38 = !DILocation(line: 48, column: 35, scope: !22)
!39 = !DILocation(line: 50, column: 3, scope: !22)
!40 = distinct !DISubprogram(name: "svp_simple_018_001_isr_func1", scope: !8, file: !8, line: 53, type: !9, scopeLine: 53, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!41 = !DILocation(line: 54, column: 28, scope: !40)
!42 = !DILocation(line: 55, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "svp_simple_018_001_isr_1", scope: !8, file: !8, line: 57, type: !9, scopeLine: 57, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!44 = !DILocation(line: 58, column: 3, scope: !43)
!45 = !DILocation(line: 59, column: 28, scope: !43)
!46 = !DILocation(line: 60, column: 1, scope: !43)
!47 = distinct !DISubprogram(name: "svp_simple_018_001_isr_2", scope: !8, file: !8, line: 62, type: !9, scopeLine: 62, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 63, column: 3, scope: !47)
!49 = !DILocation(line: 54, column: 28, scope: !40, inlinedAt: !50)
!50 = distinct !DILocation(line: 64, column: 3, scope: !47)
!51 = !DILocation(line: 65, column: 1, scope: !47)
