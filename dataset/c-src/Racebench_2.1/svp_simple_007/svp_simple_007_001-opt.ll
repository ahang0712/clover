; ModuleID = 'svp_simple_007_001-opt.bc'
source_filename = "./svp_simple_007_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_007_001_global_var = global i32 0, align 4
@svp_simple_007_001_global_array = common global [5 x i32] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define void @svp_simple_007_001_main() #0 !dbg !7 {
  call void (...) @init(), !dbg !10
  %1 = load volatile i32, i32* @svp_simple_007_001_global_var, align 4, !dbg !11, !tbaa !12
  %2 = sext i32 %1 to i64, !dbg !16
  %3 = getelementptr inbounds [5 x i32], [5 x i32]* @svp_simple_007_001_global_array, i64 0, i64 %2, !dbg !16
  store volatile i32 1, i32* %3, align 4, !dbg !17, !tbaa !12
  %4 = load volatile i32, i32* @svp_simple_007_001_global_var, align 4, !dbg !18, !tbaa !12
  %5 = sext i32 %4 to i64, !dbg !19
  %6 = getelementptr inbounds [5 x i32], [5 x i32]* @svp_simple_007_001_global_array, i64 0, i64 %5, !dbg !19
  %7 = load volatile i32, i32* %6, align 4, !dbg !19, !tbaa !12
  %8 = call i32 (...) @rand(), !dbg !20
  %9 = icmp eq i32 %8, 2, !dbg !21
  br i1 %9, label %10, label %13, !dbg !22

10:                                               ; preds = %0
  %11 = sext i32 %8 to i64, !dbg !23
  %12 = getelementptr inbounds [5 x i32], [5 x i32]* @svp_simple_007_001_global_array, i64 0, i64 %11, !dbg !23
  store volatile i32 2, i32* %12, align 4, !dbg !24, !tbaa !12
  br label %16, !dbg !23

13:                                               ; preds = %0
  %14 = sext i32 %8 to i64, !dbg !25
  %15 = getelementptr inbounds [5 x i32], [5 x i32]* @svp_simple_007_001_global_array, i64 0, i64 %14, !dbg !25
  store volatile i32 9, i32* %15, align 4, !dbg !26, !tbaa !12
  br label %16

16:                                               ; preds = %13, %10
  %17 = load volatile i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @svp_simple_007_001_global_array, i64 0, i64 2), align 8, !dbg !27, !tbaa !12
  ret void, !dbg !28
}

declare void @init(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

declare i32 @rand(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_007_001_isr_1() #0 !dbg !29 {
  call void (...) @idlerun(), !dbg !30
  store volatile i32 9, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @svp_simple_007_001_global_array, i64 0, i64 2), align 8, !dbg !31, !tbaa !12
  %1 = load volatile i32, i32* @svp_simple_007_001_global_var, align 4, !dbg !32, !tbaa !12
  %2 = add nsw i32 %1, 1, !dbg !32
  store volatile i32 %2, i32* @svp_simple_007_001_global_var, align 4, !dbg !32, !tbaa !12
  %3 = load volatile i32, i32* @svp_simple_007_001_global_var, align 4, !dbg !33, !tbaa !12
  %4 = sext i32 %3 to i64, !dbg !34
  %5 = getelementptr inbounds [5 x i32], [5 x i32]* @svp_simple_007_001_global_array, i64 0, i64 %4, !dbg !34
  store volatile i32 9, i32* %5, align 4, !dbg !35, !tbaa !12
  ret void, !dbg !36
}

declare void @idlerun(...) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_007_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_007")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_007_001_main", scope: !8, file: !8, line: 11, type: !9, scopeLine: 11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_007_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_007")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 12, column: 3, scope: !7)
!11 = !DILocation(line: 17, column: 35, scope: !7)
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !DILocation(line: 17, column: 3, scope: !7)
!17 = !DILocation(line: 17, column: 66, scope: !7)
!18 = !DILocation(line: 19, column: 45, scope: !7)
!19 = !DILocation(line: 19, column: 13, scope: !7)
!20 = !DILocation(line: 21, column: 11, scope: !7)
!21 = !DILocation(line: 22, column: 9, scope: !7)
!22 = !DILocation(line: 22, column: 7, scope: !7)
!23 = !DILocation(line: 23, column: 5, scope: !7)
!24 = !DILocation(line: 23, column: 40, scope: !7)
!25 = !DILocation(line: 25, column: 5, scope: !7)
!26 = !DILocation(line: 25, column: 40, scope: !7)
!27 = !DILocation(line: 27, column: 13, scope: !7)
!28 = !DILocation(line: 28, column: 1, scope: !7)
!29 = distinct !DISubprogram(name: "svp_simple_007_001_isr_1", scope: !8, file: !8, line: 30, type: !9, scopeLine: 30, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!30 = !DILocation(line: 31, column: 3, scope: !29)
!31 = !DILocation(line: 32, column: 38, scope: !29)
!32 = !DILocation(line: 34, column: 33, scope: !29)
!33 = !DILocation(line: 35, column: 35, scope: !29)
!34 = !DILocation(line: 35, column: 3, scope: !29)
!35 = !DILocation(line: 35, column: 66, scope: !29)
!36 = !DILocation(line: 36, column: 1, scope: !29)
