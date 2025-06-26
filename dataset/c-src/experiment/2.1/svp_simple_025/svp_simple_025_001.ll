; ModuleID = 'svp_simple_025_001.bc'
source_filename = "./svp_simple_025_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_025_001_global_var = common global i32 0, align 4
@svp_simple_025_001_global_array = common global [100 x i32*] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define void @svp_simple_025_001_main() #0 !dbg !7 {
  call void @svp_simple_025_001_init(), !dbg !10
  call void @svp_simple_025_001_func_1(i32* @svp_simple_025_001_global_var), !dbg !11
  ret void, !dbg !12
}

; Function Attrs: nounwind uwtable
define void @svp_simple_025_001_func_1(i32* %0) #0 !dbg !13 {
  %2 = alloca i32*, align 8
  store i32* %0, i32** %2, align 8, !tbaa !14
  %3 = load i32*, i32** %2, align 8, !dbg !18, !tbaa !14
  %4 = load i32, i32* %3, align 4, !dbg !19, !tbaa !20
  %5 = add nsw i32 %4, 1, !dbg !22
  %6 = load i32*, i32** %2, align 8, !dbg !23, !tbaa !14
  store i32 %5, i32* %6, align 4, !dbg !24, !tbaa !20
  ret void, !dbg !25
}

; Function Attrs: nounwind uwtable
define void @svp_simple_025_001_init() #0 !dbg !26 {
  %1 = call i32 (...) @rand(), !dbg !27
  store volatile i32 %1, i32* @svp_simple_025_001_global_var, align 4, !dbg !28, !tbaa !20
  call void (...) @init(), !dbg !29
  ret void, !dbg !30
}

declare i32 @rand(...) #1

declare void @init(...) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_025_001_isr_1() #0 !dbg !31 {
  store volatile i32 0, i32* @svp_simple_025_001_global_var, align 4, !dbg !32, !tbaa !20
  ret void, !dbg !33
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_025_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_025")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_025_001_main", scope: !8, file: !8, line: 24, type: !9, scopeLine: 24, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_025_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_025")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 25, column: 3, scope: !7)
!11 = !DILocation(line: 26, column: 3, scope: !7)
!12 = !DILocation(line: 27, column: 1, scope: !7)
!13 = distinct !DISubprogram(name: "svp_simple_025_001_func_1", scope: !8, file: !8, line: 34, type: !9, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!14 = !{!15, !15, i64 0}
!15 = !{!"any pointer", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C/C++ TBAA"}
!18 = !DILocation(line: 35, column: 15, scope: !13)
!19 = !DILocation(line: 35, column: 14, scope: !13)
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !16, i64 0}
!22 = !DILocation(line: 35, column: 23, scope: !13)
!23 = !DILocation(line: 35, column: 4, scope: !13)
!24 = !DILocation(line: 35, column: 12, scope: !13)
!25 = !DILocation(line: 36, column: 1, scope: !13)
!26 = distinct !DISubprogram(name: "svp_simple_025_001_init", scope: !8, file: !8, line: 28, type: !9, scopeLine: 28, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!27 = !DILocation(line: 29, column: 35, scope: !26)
!28 = !DILocation(line: 29, column: 33, scope: !26)
!29 = !DILocation(line: 31, column: 3, scope: !26)
!30 = !DILocation(line: 32, column: 1, scope: !26)
!31 = distinct !DISubprogram(name: "svp_simple_025_001_isr_1", scope: !8, file: !8, line: 37, type: !9, scopeLine: 37, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!32 = !DILocation(line: 38, column: 33, scope: !31)
!33 = !DILocation(line: 39, column: 1, scope: !31)
