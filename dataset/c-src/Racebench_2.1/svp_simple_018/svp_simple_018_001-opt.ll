; ModuleID = 'svp_simple_018_001-opt.bc'
source_filename = "./svp_simple_018_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_018_001_para1 = common global float 0.000000e+00, align 4
@svp_simple_018_001_para2 = common global float 0.000000e+00, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_018_001_main() #0 !dbg !7 {
  call void @enable_isr(i32 1), !dbg !10
  call void @enable_isr(i32 2), !dbg !11
  %1 = load volatile float, float* @svp_simple_018_001_para1, align 4, !dbg !12, !tbaa !15
  %2 = fmul float 2.000000e+00, %1, !dbg !19
  %3 = load volatile float, float* @svp_simple_018_001_para2, align 4, !dbg !20, !tbaa !15
  %4 = fmul float %2, %3, !dbg !21
  %5 = load volatile float, float* @svp_simple_018_001_para1, align 4, !dbg !22, !tbaa !15
  %6 = load volatile float, float* @svp_simple_018_001_para2, align 4, !dbg !25, !tbaa !15
  %7 = fmul float %5, %6, !dbg !26
  %8 = load volatile float, float* @svp_simple_018_001_para2, align 4, !dbg !27, !tbaa !15
  %9 = fmul float %7, %8, !dbg !28
  ret void, !dbg !29
}

declare void @enable_isr(i32) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define float @svp_simple_018_001_func1() #0 !dbg !13 {
  %1 = load volatile float, float* @svp_simple_018_001_para1, align 4, !dbg !30, !tbaa !15
  %2 = fmul float 2.000000e+00, %1, !dbg !31
  %3 = load volatile float, float* @svp_simple_018_001_para2, align 4, !dbg !32, !tbaa !15
  %4 = fmul float %2, %3, !dbg !33
  ret float %4, !dbg !34
}

; Function Attrs: nounwind uwtable
define float @svp_simple_018_001_func2() #0 !dbg !23 {
  %1 = load volatile float, float* @svp_simple_018_001_para1, align 4, !dbg !35, !tbaa !15
  %2 = load volatile float, float* @svp_simple_018_001_para2, align 4, !dbg !36, !tbaa !15
  %3 = fmul float %1, %2, !dbg !37
  %4 = load volatile float, float* @svp_simple_018_001_para2, align 4, !dbg !38, !tbaa !15
  %5 = fmul float %3, %4, !dbg !39
  ret float %5, !dbg !40
}

; Function Attrs: nounwind uwtable
define void @svp_simple_018_001_isr_func1() #0 !dbg !41 {
  store volatile float 1.000000e+00, float* @svp_simple_018_001_para2, align 4, !dbg !42, !tbaa !15
  ret void, !dbg !43
}

; Function Attrs: nounwind uwtable
define void @svp_simple_018_001_isr_1() #0 !dbg !44 {
  call void (...) @idlerun(), !dbg !45
  store volatile float 2.000000e+00, float* @svp_simple_018_001_para1, align 4, !dbg !46, !tbaa !15
  ret void, !dbg !47
}

declare void @idlerun(...) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_018_001_isr_2() #0 !dbg !48 {
  call void (...) @idlerun(), !dbg !49
  store volatile float 1.000000e+00, float* @svp_simple_018_001_para2, align 4, !dbg !50, !tbaa !15
  ret void, !dbg !52
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_018_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_018")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_018_001_main", scope: !8, file: !8, line: 15, type: !9, scopeLine: 15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_018_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_018")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 17, column: 3, scope: !7)
!11 = !DILocation(line: 18, column: 3, scope: !7)
!12 = !DILocation(line: 27, column: 18, scope: !13, inlinedAt: !14)
!13 = distinct !DISubprogram(name: "svp_simple_018_001_func1", scope: !8, file: !8, line: 25, type: !9, scopeLine: 25, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!14 = distinct !DILocation(line: 21, column: 33, scope: !7)
!15 = !{!16, !16, i64 0}
!16 = !{!"float", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C/C++ TBAA"}
!19 = !DILocation(line: 27, column: 16, scope: !13, inlinedAt: !14)
!20 = !DILocation(line: 28, column: 14, scope: !13, inlinedAt: !14)
!21 = !DILocation(line: 27, column: 43, scope: !13, inlinedAt: !14)
!22 = !DILocation(line: 34, column: 10, scope: !23, inlinedAt: !24)
!23 = distinct !DISubprogram(name: "svp_simple_018_001_func2", scope: !8, file: !8, line: 32, type: !9, scopeLine: 32, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!24 = distinct !DILocation(line: 22, column: 29, scope: !7)
!25 = !DILocation(line: 35, column: 10, scope: !23, inlinedAt: !24)
!26 = !DILocation(line: 34, column: 35, scope: !23, inlinedAt: !24)
!27 = !DILocation(line: 36, column: 10, scope: !23, inlinedAt: !24)
!28 = !DILocation(line: 35, column: 35, scope: !23, inlinedAt: !24)
!29 = !DILocation(line: 23, column: 1, scope: !7)
!30 = !DILocation(line: 27, column: 18, scope: !13)
!31 = !DILocation(line: 27, column: 16, scope: !13)
!32 = !DILocation(line: 28, column: 14, scope: !13)
!33 = !DILocation(line: 27, column: 43, scope: !13)
!34 = !DILocation(line: 29, column: 3, scope: !13)
!35 = !DILocation(line: 34, column: 10, scope: !23)
!36 = !DILocation(line: 35, column: 10, scope: !23)
!37 = !DILocation(line: 34, column: 35, scope: !23)
!38 = !DILocation(line: 36, column: 10, scope: !23)
!39 = !DILocation(line: 35, column: 35, scope: !23)
!40 = !DILocation(line: 37, column: 3, scope: !23)
!41 = distinct !DISubprogram(name: "svp_simple_018_001_isr_func1", scope: !8, file: !8, line: 40, type: !9, scopeLine: 40, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!42 = !DILocation(line: 41, column: 28, scope: !41)
!43 = !DILocation(line: 42, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "svp_simple_018_001_isr_1", scope: !8, file: !8, line: 44, type: !9, scopeLine: 44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 45, column: 3, scope: !44)
!46 = !DILocation(line: 46, column: 28, scope: !44)
!47 = !DILocation(line: 47, column: 1, scope: !44)
!48 = distinct !DISubprogram(name: "svp_simple_018_001_isr_2", scope: !8, file: !8, line: 49, type: !9, scopeLine: 49, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 50, column: 3, scope: !48)
!50 = !DILocation(line: 41, column: 28, scope: !41, inlinedAt: !51)
!51 = distinct !DILocation(line: 51, column: 3, scope: !48)
!52 = !DILocation(line: 52, column: 1, scope: !48)
